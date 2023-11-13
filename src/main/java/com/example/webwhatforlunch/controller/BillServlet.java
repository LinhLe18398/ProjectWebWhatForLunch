package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.Bill;
import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.service.BillDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "bill", urlPatterns = "/bill")
public class BillServlet extends HttpServlet {
    private BillDAO billDAO = new BillDAO();

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search-bill":
                searchBillUser(request, response);
                break;
            case "cancel-accept-bill":
                cancelAcceptBill(request, response);
                break;
        }
    }


    private void getBillUser(HttpServletRequest request, HttpServletResponse response) {
            List<Bill> billList = billDAO.getBillUser(2);
    }

    private void getBillMerchant(HttpServletRequest request, HttpServletResponse response) {
        List<Bill> merchantList = billDAO.getBillMerchant("M10");
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
    private void cancelAcceptBill(HttpServletRequest request, HttpServletResponse response)  {
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant) session.getAttribute("merchant");
        String idMerchant = merchant.getIdMerchant();

        int idBill = Integer.parseInt(request.getParameter("idBill"));
        int number = Integer.parseInt(request.getParameter("active"));

        System.out.println(idBill + " " + idMerchant + " " + number);
        List<Bill> billList = billDAO.getBillMerchant(idMerchant);
        try {
            billDAO.setStatusBill(idBill, 0, number);
            request.setAttribute("billList", billList);
            request.getRequestDispatcher("home/merchantHome.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException | SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
