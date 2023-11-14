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
    private void cancelAcceptBill(HttpServletRequest request, HttpServletResponse response) {
        int idBill = Integer.parseInt(request.getParameter("how"));
        int number = Integer.parseInt(request.getParameter("active"));

        HttpSession httpSession = request.getSession();
        Merchant merchant = (Merchant) httpSession.getAttribute("merchant");

        List<Bill> billList = billDAO.getBillMerchant(merchant.getIdMerchant());
        try {
            if (number == 1) {
                billDAO.activeBill(idBill, 0);
            }
            if (number == 0) {
                billDAO.cancelBill(idBill, 0);
            }
            request.setAttribute("billList", billList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home/merchantHome.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
