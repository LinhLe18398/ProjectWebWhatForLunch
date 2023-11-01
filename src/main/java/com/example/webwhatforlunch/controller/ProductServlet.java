package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.model.Product;
import com.example.webwhatforlunch.service.ProductDAO;
import com.example.webwhatforlunch.service.UserDAO;

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

@WebServlet(name = "ProductServlet", urlPatterns = "/products")

public class ProductServlet extends HttpServlet {
    private UserDAO userDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create-product":
                showCreateProductForm(req, resp);
                break;
            case "update-product":
                showUpdateProductForm(req, resp);
                break;
            case "delete-product":
                deleteProduct(req, resp);
                break;
            case "home-merchant":
                showAllProductMerchant(req, resp);
                break;
        }
    }

    private void showUpdateProductForm(HttpServletRequest req, HttpServletResponse resp){
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/product-update-form.jsp");
        try {
            Product product = productDAO.getProductById(req.getParameter("id"));
            req.setAttribute("product",product);
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    private void showCreateProductForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/product-create-form.jsp");
        dispatcher.forward(req, resp);
    }


    private void showAllProductMerchant(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession();
            Merchant merchant = (Merchant) session.getAttribute("merchant");
            List<Product> productList = productDAO.getAllProductByIdMerchant(merchant.getIdMerchant());
            req.setAttribute("productList", productList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("home/merchantHome.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException | ClassNotFoundException | ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession httpSession = req.getSession();
        Merchant merchant = (Merchant) httpSession.getAttribute("merchant");
        String idProduct = req.getParameter("id");
        List<Product> productList = null;
        try {
            productDAO.deleteProduct(idProduct);
            productList = productDAO.getAllProductByIdMerchant(merchant.getIdMerchant());
            req.setAttribute("productList", productList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("home/merchantHome.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException | ClassNotFoundException | ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createProduct":
                try {
                    createProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "update-product" :
                updateProduct(req, resp);
                break;
            case "search":
                try {
                    searchByName(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, IOException, ServletException {
        HttpSession httpSession = req.getSession();
        Merchant merchant = (Merchant) httpSession.getAttribute("merchant");
        String idMerchant = merchant.getIdMerchant();

        String name = req.getParameter("product_name");
        HttpSession session = req.getSession();
        session.getAttribute("user");
        String img = req.getParameter("product_image");
        int waiTime = Integer.parseInt(req.getParameter("product_waiTime"));
        double price = Double.parseDouble(req.getParameter("product_price"));
        String note = req.getParameter("product_note");
        double sale = Double.parseDouble(req.getParameter("product_promotionalPrice"));
        double service = Double.parseDouble(req.getParameter("product_serviceCharge"));

        Product product = new Product(idMerchant, name,waiTime, img , price, note, sale, service);
        productDAO.createProduct(product);
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/product-create-form.jsp");
        dispatcher.forward(req, resp);
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) {
        try {
            Product product =  null;
            String idProduct = req.getParameter("product_id");
            String productName = req.getParameter("product_name");
            String productImg = req.getParameter("product_image");
            int waitTime = Integer.parseInt(req.getParameter("product_waiTime"));
            double price = Double.parseDouble(req.getParameter("product_price"));
            String note = req.getParameter("product_note");
            double sale = Double.parseDouble(req.getParameter("product_sale"));
            double serviceFee = Double.parseDouble(req.getParameter("product_serviceFee"));

            product = new Product(idProduct, productName, productImg, waitTime, price, note, sale, serviceFee);
            productDAO.updateProduct(product);

            RequestDispatcher dispatcher = req.getRequestDispatcher("product/product-update-form.jsp");
            dispatcher.forward(req, resp);
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

    private void searchByName(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        HttpSession httpSession = req.getSession();
        Merchant merchant = (Merchant) httpSession.getAttribute("merchant");
        String idMerchant = merchant.getIdMerchant();
        String keyword = req.getParameter("search");
        List<Product> productList = productDAO.searchProductByName(idMerchant,keyword);
        req.setAttribute("productList",productList);
        req.getRequestDispatcher("home/merchantHome.jsp").forward(req,resp);
    }

}
