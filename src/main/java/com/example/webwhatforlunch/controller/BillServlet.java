package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.Bill;
import com.example.webwhatforlunch.service.BillDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            case "bill-user": getBillUser(request, response); break;
        }
    }

    private void getBillUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Bill> billList = billDAO.getBillUser(2);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
