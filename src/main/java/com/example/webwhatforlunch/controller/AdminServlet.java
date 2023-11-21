package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.service.AdminDAO;
import com.example.webwhatforlunch.service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")

public class AdminServlet extends HttpServlet {
    private AdminDAO adminDAO;
    private UserDAO userDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                showLoginForm(req, resp);
                break;
            case "showMerchant":
                try {
                    ShowMerchant(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void ShowMerchant(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Merchant> merchantList = userDAO.showMerchant();
        req.setAttribute("merchant", merchantList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("display/showMerchant.jsp");
        dispatcher.forward(req, resp);
    }

    private void showLoginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("admin/admin-login-form.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                loginAdmin(req, resp);
                break;
            case "clickStatus":
                try {
                    setStatusMerchant(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void loginAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            RequestDispatcher dispatcher;
            if (adminDAO.checkAdmin(email, password)) {
                dispatcher = req.getRequestDispatcher("home/homeAdmin.jsp");
                dispatcher.forward(req, resp);
            } else {
                JOptionPane.showMessageDialog(null, "thông tin email hoặc mật khẩu sai");
                dispatcher = req.getRequestDispatcher("admin/admin-login-form.jsp");
            }
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


    private void setStatusMerchant(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("how"));
        int number = Integer.parseInt(req.getParameter("active"));

        adminDAO.setStatusMerchant(id, number);
        List<Merchant> merchantList = userDAO.showMerchant();
        req.setAttribute("merchant", merchantList);
        req.getRequestDispatcher("display/showMerchant.jsp").forward(req, resp);
    }
}
