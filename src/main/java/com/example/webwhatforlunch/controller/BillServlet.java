package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.Bill;
import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.model.Product;
import com.example.webwhatforlunch.model.User;
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
import java.io.UnsupportedEncodingException;
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "bill-user":
                getListBillUser(request, response);
                break;
            case "bill-merchant":
                getBillMerchant(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
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
            case "confirm-bill":
                confirmBill(request, response);
                break;
            case "event-bill-from-user":
                eventBillFromUser(request, response);
                break;
        }
    }
    private void getListBillUser(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Bill> listBillUser = billDAO.getBillUser(user.getId());
        try {
            request.setAttribute("user", user);
            request.setAttribute("listBillUser", listBillUser);
            RequestDispatcher dispatcher = request.getRequestDispatcher("display/billUser.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
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

    private void confirmBill(HttpServletRequest request, HttpServletResponse response){
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("user");
        int idUser = user.getId();

        String recipientName = request.getParameter("name");
        String recipientPhone = request.getParameter("phone");
        String detailedAddress = request.getParameter("address");
        String payment = request.getParameter("payment");

        String selectedItems = request.getParameter("listId");
        if (selectedItems.startsWith("/")) {
            selectedItems = selectedItems.substring(1);
        }

        String quantity = request.getParameter("listQuantity");
        if (quantity.startsWith("/")) {
            quantity = quantity.substring(1);
        }

        try {
            if (selectedItems != null && quantity != null) {
                String[] idProduct = selectedItems.split("/");
                String[] quantityArray = quantity.split("/");
                String idMerchant = productDAO.getProductById(idProduct[0]).getIdMerchant();

                List<Product> productList = new ArrayList<>();
                for (int i = 0; i < idProduct.length; i++) {
                    Product product = productDAO.getProductById(idProduct[i]);
                    if (product != null) {
                        product.setQuantity(Integer.parseInt(quantityArray[i]));
                        productList.add(product);
                    }
                }
                int idBill = billDAO.createBill(idUser, idMerchant, recipientName, recipientPhone, detailedAddress, payment);
                billDAO.createProductToBill(idBill,productList);
            }

            request.setAttribute("name",recipientName);
            request.getRequestDispatcher("display/billUser.jsp").forward(request, response);
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

    private void statusBill(HttpServletRequest request, HttpServletResponse response) {
        int number= Integer.parseInt(request.getParameter("active"));
        if (number == 2) {
            showDetailBillMerchant(request, response);
        } else {
            setStatusBill(request, response);
        }
    }

    private void setStatusBill(HttpServletRequest request, HttpServletResponse response) {
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

    private void showDetailBillMerchant(HttpServletRequest request, HttpServletResponse response) {
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

    private void showDetailBillUser(HttpServletRequest request, HttpServletResponse response) {
        int idBill = Integer.parseInt(request.getParameter("idBill"));
        try {
            Bill billUser = billDAO.getBillById(idBill);
            request.setAttribute("billUser", billUser);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/detailBillUser.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
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


    private void eventBillFromUser(HttpServletRequest request, HttpServletResponse response) {
        int idBill = Integer.parseInt(request.getParameter("idBill"));
        int number = Integer.parseInt(request.getParameter("active"));
        System.out.println(number);
        try {
            switch (number) {
                case 3 :
                    billDAO.cancelBill(idBill, 0);
                    getListBillUser(request, response);
                    break;
                case 4 :
                    showDetailBillUser(request, response);
                default:
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
