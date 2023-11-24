package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.*;
import com.example.webwhatforlunch.service.BillDAO;
import com.example.webwhatforlunch.service.ProductDAO;
import com.example.webwhatforlunch.service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "userServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;
    private ProductDAO productDAO;
    private BillDAO billDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        productDAO = new ProductDAO();
        billDAO = new BillDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "home":
                showHomeForm(req, resp);
                break;
            case "login":
                showLoginForm(req, resp);
                break;
            case "create":
                showCreateForm(req, resp);
                break;
            case "merchant":
                showRegisterMerchantForm(req, resp);
                break;
            case "merchantHome":
                showHomeMerchant(req, resp);
                break;
            case "comfirmpassword":
                showComFirmPassword(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "cart":
                showCart(req, resp);
                break;
            case "logout":
                logOutUser(req, resp);
                break;
            case "search":
                search(req, resp);
                break;
            case "restaurant":
                showRestaurant(req, resp);
                break;
            case "order":
                try {
                    showComFirmOrder(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

        }
    }

    private void showComFirmOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        HttpSession httpSession = req.getSession();
        User user = (User) httpSession.getAttribute("user");
        int id = user.getId();

        List<DeliveryAddress> deliveryAddress = userDAO.getAllUserAddress(id);
        req.setAttribute("address", deliveryAddress);
        RequestDispatcher dispatcher = req.getRequestDispatcher("display/comfirmOrder.jsp");
        dispatcher.forward(req, resp);
    }

    private void showRestaurant(HttpServletRequest req, HttpServletResponse resp) {
        String idMerchant = req.getParameter("idMerchant");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("merchant/merchantProfile.jsp");
        try {
            List<Product> productList = productDAO.getProductsMerchant(idMerchant);
            Merchant merchant = userDAO.getAllMerchant(idMerchant);
            req.setAttribute("merchants", merchant);
            req.setAttribute("products", productList);
            requestDispatcher.forward(req, resp);
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

    private void search(HttpServletRequest req, HttpServletResponse resp) {
        String nameSearch = req.getParameter("name_search");
        String quickSearch = req.getParameter("quick_search");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/userHome.jsp");
        List<Product> productList = null;
        try {
            List<Product> productBestSale = productDAO.getBestSaleProduct();
            List<Product> productRecommend = productDAO.getRecommendProduct();
            if (nameSearch != null) {
                productList = productDAO.searchProductByName(nameSearch);
            } else if (nameSearch != null && quickSearch != null) {
                productList = productDAO.searchProductByNameAndTag(nameSearch, quickSearch);
            } else {
                productList = productDAO.searchProductByTag(quickSearch);
            }
            req.setAttribute("nameSearch", nameSearch);
            req.setAttribute("tagSearch", quickSearch);
            req.setAttribute("pro", productList);
//            req.setAttribute("productBestSale", productBestSale);
//            req.setAttribute("productRecommend", productRecommend);
            requestDispatcher.forward(req,resp);
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

    private void showCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("display/cart.jsp");
        dispatcher.forward(req, resp);
    }

    private void showComFirmPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("display/comFirmPassword.jsp");
        dispatcher.forward(req, resp);
    }

    private void showHomeMerchant(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("home/merchantHome.jsp");
        dispatcher.forward(req, resp);
    }

    private void showRegisterMerchantForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("merchant/merchant-register-form.jsp");
        dispatcher.forward(req, resp);
    }

    private void showLoginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/user-login-form.jsp");
        dispatcher.forward(req, resp);
    }

    private void showHomeForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Product> productList = userDAO.get_All_Product();
            List<Product> productBestSale = productDAO.getBestSaleProduct();
            List<Product> productRecommend = productDAO.getRecommendProduct();
            req.setAttribute("pro", productList);
            req.setAttribute("productBestSale", productBestSale);
            req.setAttribute("productRecommend", productRecommend);

            HttpSession session = req.getSession();
            session.getAttribute("user");
            RequestDispatcher dispatcher = req.getRequestDispatcher("home/userHome.jsp");
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

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/user-register-form.jsp");
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
            case "create":
                try {
                    createUser(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "login":
                try {
                    loginUser(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "merchant":
                try {
                    createNewMerchant(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "comfirmpassword":
                try {
                    loginMerchant(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    editUser(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "create-new-address":
                try {
                    createAddress(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "order":
                try {
                    orderProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete-address":
                try {
                    deleteAddress(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "updateAddress":
                try {
                    updateAddress(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void updateAddress(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        DeliveryAddress deliveryAddress;
        int addressId = Integer.parseInt(req.getParameter("addressId"));
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        deliveryAddress = new DeliveryAddress(addressId, name, phone, address);
        userDAO.updateAddress(deliveryAddress);
        RequestDispatcher dispatcher = req.getRequestDispatcher("display/comfirmOrder.jsp");
        dispatcher.forward(req, resp);
    }

    private void deleteAddress(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, IOException, ServletException {
        int selectedAddressId = Integer.parseInt(req.getParameter("flexRadioDefault"));
        if (selectedAddressId != 0) {
            userDAO.deleteAddress(selectedAddressId);
            HttpSession httpSession = req.getSession();
            User user = (User) httpSession.getAttribute("user");
            int id = user.getId();
            List<DeliveryAddress> deliveryAddress = userDAO.getAllUserAddress(id);
            req.setAttribute("address", deliveryAddress);

            RequestDispatcher dispatcher = req.getRequestDispatcher("display/comfirmOrder.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.getWriter().println("Vui lòng chọn một địa chỉ để xóa.");
        }

    }

    private void orderProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String selectedItems = req.getParameter("idProduct");
        String quantity = req.getParameter("quantity");

        if (selectedItems != null && quantity != null) {
            String[] idProduct = selectedItems.split("/");
            String[] quantityArray = quantity.split("/");

            List<Product> productList = new ArrayList<>();
            for (int i = 0; i < idProduct.length; i++) {
                Product product = productDAO.getProductById(idProduct[i]);
                if (product != null) {
                    product.setQuantity(Integer.parseInt(quantityArray[i]));
                    productList.add(product);
                }
            }
            HttpSession httpSession = req.getSession();
            User user = (User) httpSession.getAttribute("user");
            int id = user.getId();
            List<DeliveryAddress> deliveryAddress = userDAO.getAllUserAddress(id);
            req.setAttribute("address", deliveryAddress);
            req.setAttribute("idProduct", selectedItems);
            req.setAttribute("quantity", quantity);
            HttpSession session = req.getSession();
            session.setAttribute("product", productList);
            req.getRequestDispatcher("display/comfirmOrder.jsp").forward(req, resp);
        }
    }

    private void createAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String addressId = req.getParameter("addressId");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");

        HttpSession httpSession = req.getSession();
        User user = (User) httpSession.getAttribute("user");
        int id = user.getId();

        if (addressId == null || addressId.isEmpty()) {
            userDAO.createAddress(id, name, phone, address);
        }

        List<DeliveryAddress> deliveryAddress = userDAO.getAllUserAddress(id);
        req.setAttribute("address", deliveryAddress);
        req.getRequestDispatcher("display/comfirmOrder.jsp").forward(req, resp);
    }


    private void loginMerchant(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String password = req.getParameter("password");
        HttpSession httpSession = req.getSession();
        User user = (User) httpSession.getAttribute("user");
        int id = user.getId();

        RequestDispatcher dispatcher;
        Merchant merchant = userDAO.checkLoginMerchant(id, password);
        if (merchant != null && merchant.getIdMerchant() != null) {
            List<Product> productList = productDAO.getAllProductByIdMerchant(merchant.getIdMerchant());
            List<Bill> billList = billDAO.getBillMerchant(merchant.getIdMerchant());

            HttpSession session = req.getSession();
            session.setAttribute("merchant", merchant);
            req.setAttribute("user", user);
            req.setAttribute("productList", productList);
            req.setAttribute("billList", billList);
            dispatcher = req.getRequestDispatcher("home/merchantHome.jsp");
        } else {
            JOptionPane.showMessageDialog(null, "Sai mật khẩu");
            dispatcher = req.getRequestDispatcher("display/comFirmPassword.jsp");
        }
        dispatcher.forward(req, resp);
    }

    private void logOutUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        session.removeAttribute("user");
        session.removeAttribute("isLogin");
        session.invalidate();
        RequestDispatcher dispatcher = req.getRequestDispatcher("home/userHome.jsp");
        showHomeForm(req, resp);
//        dispatcher.forward(req, resp);
    }

    private void createNewMerchant(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        HttpSession httpSession = request.getSession();
        int idUser = ((User) httpSession.getAttribute("user")).getId();
        String name = request.getParameter("restaurantName");
        String phoneNumber = request.getParameter("restaurantPhoneNumber");
        String email = request.getParameter("restaurantEmail");
        String address = request.getParameter("restaurantAddress");
        Merchant merchant = new Merchant(idUser, name, email, phoneNumber, address);

        userDAO.requestUserToMerchant(merchant);
        request.setAttribute("alert", "đợi admin duyêt tài khoản");
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/merchant-register-form.jsp");
        dispatcher.forward(request, response);
    }

    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        User user;
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/user-register-form.jsp");
        boolean result = userDAO.checkDuplicate(email);
        if (result) {
            user = new User(name, email, password);
            userDAO.createUser(user);
            req.setAttribute("success", "tài khoản được tạo");
        } else {
            req.setAttribute("error", " tài khoản không được tạo");
        }
        dispatcher.forward(req, resp);
    }

    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException {
        User user;
        String username = req.getParameter("email");
        String password = req.getParameter("password");

        RequestDispatcher dispatcher;
        user = userDAO.checkLoginUser(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("isLogin", true);
            List<Product> productList = userDAO.get_All_Product();
            req.setAttribute("pro", productList);
            session.getAttribute("user");
            HttpSession httpSession = req.getSession();
            Merchant idMerchant = userDAO.returnIdMerchantByIdUser(user.getId());
            httpSession.setAttribute("merchantId", idMerchant);
            httpSession.getAttribute("merchantId");
            httpSession.setAttribute("isLoginMerchant", true);
            dispatcher = req.getRequestDispatcher("home/userHome.jsp");
        } else {
            JOptionPane.showMessageDialog(null, "Sai tên tài khoản hoặc mật khẩu");
            dispatcher = req.getRequestDispatcher("user/user-login-form.jsp");
        }
        showHomeForm(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int id = user.getId();
        try {
            User user1 = userDAO.findUserById(id);
            req.setAttribute("user", user1);
            RequestDispatcher dispatcher = req.getRequestDispatcher("display/user-edit.jsp");
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

    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        HttpSession httpSession = req.getSession();
        User user = (User) httpSession.getAttribute("user");
        int id = user.getId();
        String name = new String(req.getParameter("name").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String gender = new String(req.getParameter("gender").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

        String phoneNumber = req.getParameter("phoneNumber");
        String birthday = req.getParameter("birthday");
        String img = req.getParameter("img");
        String address = new String(req.getParameter("address").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

        user = new User(id, name, gender, phoneNumber, birthday, img, address);
        httpSession.setAttribute("user", user);
        userDAO.updateUser(user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("home/userHome.jsp");
        dispatcher.forward(req, resp);
    }

}
