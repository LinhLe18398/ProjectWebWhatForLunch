package com.example.webwhatforlunch.controller;

import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.model.Product;
import com.example.webwhatforlunch.model.User;
import com.example.webwhatforlunch.service.ProductDAO;
import com.example.webwhatforlunch.service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "userServlet", value = "/users")

public class UserServlet extends HttpServlet {
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
        }
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
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/userHome.jsp");
        List<Product> productList = null;
        try {
            if (nameSearch != null) {
                productList = productDAO.searchProductByName(nameSearch);
            } else {
                String quickSearch = req.getParameter("quick_search");
                productList = productDAO.searchProductByTag(quickSearch);
                req.setAttribute("tagSearch", quickSearch);
            }
            req.setAttribute("pro", productList);
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
        }
    }

    private void loginMerchant(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String password = req.getParameter("password");
        HttpSession httpSession = req.getSession();
        User user = (User) httpSession.getAttribute("user");
        int id = user.getId();

        RequestDispatcher dispatcher;
        Merchant merchant = userDAO.checkLoginMerchant(id, password);
        List<Product> productList = productDAO.getAllProductByIdMerchant(merchant.getIdMerchant());

        if (merchant != null) {
            HttpSession session = req.getSession();
            session.setAttribute("merchant", merchant);
            req.setAttribute("user", user);
            req.setAttribute("productList", productList);
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
        Merchant merchant = new Merchant(idUser, name, phoneNumber, email, address);

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
            req.setAttribute("error", "tai khoản không được tạo");
        }
        dispatcher.forward(req, resp);


    }

    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
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
            dispatcher = req.getRequestDispatcher("home/userHome.jsp");
        } else {
            JOptionPane.showMessageDialog(null, "Sai tên tài khoản hoặc mật khẩu");
            dispatcher = req.getRequestDispatcher("user/user-login-form.jsp");
        }

        showHomeForm(req,resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
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
        String name = req.getParameter("name");
        String gender = req.getParameter("gender");
        String phoneNumber = req.getParameter("phoneNumber");
        String birthday = req.getParameter("birthday");
        String img = req.getParameter("img");
        String address = req.getParameter("address");
        user = new User(id, name, gender, phoneNumber, birthday, img, address);
        httpSession.setAttribute("user", user);
        userDAO.updateUser(user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("home/userHome.jsp");
        dispatcher.forward(req, resp);
    }
}
