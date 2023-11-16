package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.Bill;
import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.model.Product;
import com.example.webwhatforlunch.service.BillDAO;
import com.example.webwhatforlunch.service.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "bill", urlPatterns = "/bill")
public class BillServlet extends HttpServlet {
    private BillDAO billDAO;
    private ProductDAO productDAO;
    @Override
    public void init() {
        billDAO = new BillDAO();
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "bill-user":
                getBillUser(request, response);
                break;
            case "bill-merchant":
                getBillMerchant(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search-bill":
                searchBillUser(request, response);
                break;
            case "status-bill":
                statusBill(request, response);
                break;
        }
    }


    private void searchBillUser(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant) session.getAttribute("merchant");
        String idMerchant = merchant.getIdMerchant();
        String idBill = request.getParameter("idBill");
        String numberPhone = request.getParameter("numberPhone");
        String nameUser = request.getParameter("nameUser");
        String filter = request.getParameter("filter");
        System.out.println(idMerchant + idBill + nameUser + filter);
        List<Bill> billList = billDAO.searchInMerchantBillList(idMerchant, idBill, numberPhone, nameUser, filter);

        try {
            request.setAttribute("billList", billList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home/merchantHome.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void statusBill(HttpServletRequest request, HttpServletResponse response) {
        int number= Integer.parseInt(request.getParameter("active"));
        System.out.println(number);
        if (number == 2) {
            showDetailBill(request, response);
        } else {
            setStatusBill(request, response);
        }
    }

    private void setStatusBill(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant) session.getAttribute("merchant");

        int idBill = Integer.parseInt(request.getParameter("idBill"));
        int number = Integer.parseInt(request.getParameter("active"));

        try {
            switch (number) {
                case 0:
                    billDAO.cancelBill(idBill, 0);
                    break;
                case 1:
                    billDAO.acceptBill(idBill, 0);
                    break;
                default:
                    break;
            }
            sendListToHomeMerchant(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    private void showDetailBill(HttpServletRequest request, HttpServletResponse response) {
        int idBill = Integer.parseInt(request.getParameter("idBill"));

        try {
            Bill bill = billDAO.getBillById(idBill);
            List<Product> billProduct = billDAO.getProductListInBill(idBill);
            request.setAttribute("bill", bill);
            request.setAttribute("billProduct", billProduct);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home/detailBill.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void getBillUser(HttpServletRequest request, HttpServletResponse response) {
        List<Bill> billList = billDAO.getBillUser(2);
    }

    private void getBillMerchant(HttpServletRequest request, HttpServletResponse response) {
        sendListToHomeMerchant(request, response);
    }

    private void sendListToHomeMerchant(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant) session.getAttribute("merchant");
        try {
            List<Bill> billList = billDAO.getBillMerchant(merchant.getIdMerchant());
            List<Product> productList = productDAO.getAllProductByIdMerchant(merchant.getIdMerchant());
            request.setAttribute("productList", productList);
            request.setAttribute("billList", billList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home/merchantHome.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
