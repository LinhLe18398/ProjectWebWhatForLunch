package com.example.webwhatforlunch.service;

import com.example.webwhatforlunch.model.DeliveryAddress;
import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.model.Product;
import com.example.webwhatforlunch.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements UserInterface {
    private final String username = "root";

    private final String password = "password";


    private final String jdbcURL = "jdbc:mysql://localhost:3306/WebWhatForLunch";

    protected Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, username, password);
        return connection;
    }

    private final String REQUEST_USER_TO_MERCHANT_QUERY = "{CALL REQUEST_USER_TO_MERCHANT(?,?,?,?,?)}";
    private final String CREATE_USER_QUERY = "{CALL CREATE_USER(?,?,?)}";
    private final String LOGIN_QUERY = "{CALL LOGIN(?,?)}";
    private final String SHOW_MERCHANT_QUERY = "{CALL GET_ALL_MERCHANT()}";
    private final String CHECK_LOGIN_MERCHANT_QUERY = "{CALL LOGIN_MERCHANT(?,?)}";
    private final String CHECK_DUPLICATE_EMAIL = "{CALL CHECK_DUPLICATE_EMAIL(?,?)}";
    private final String UPDATE_PROFILE_USER = "{CALL UPDATE_DATA_USER(?,?,?,?,?,?,?)}";
    private final String GET_ALL_PRODUCT = "{CALL GET_ALL_PRODUCT()}";
    private final String GET_RESTAURANT_MERCHANT_QUERY = "{CALL GET_RESTAURANT_MERCHANT(?)}";
    private final String CREATE_ADDRESS_QUERY = "{CALL CREATE_ADDRESS(?,?,?,?)}";
    private final String GET_ALL_USER_ADDRESS_QUERY = "{CALL GET_ALL_USER_ADDRESS(?)}";
    private final String UPDATE_ADDRESS_QUERY = "{CALL UPDATE_ADDRESS(?,?,?,?)}";
    private final String DELETE_ADDRESS_QUERY = "CALL DELETE_ADDRESS(?)";


    public void deleteAddress(int idAddress) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(DELETE_ADDRESS_QUERY);
        callableStatement.setInt(1,idAddress);
        callableStatement.executeUpdate();
    }



    public boolean checkDuplicate(String email) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(CHECK_DUPLICATE_EMAIL);
        callableStatement.setString(1, email);
        callableStatement.executeQuery();
        int isDuplicate = callableStatement.getInt(2);
        if (isDuplicate == 0) {
            return true;
        }
        return false;
    }

    public void requestUserToMerchant(Merchant merchant) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement statement = connection.prepareCall(REQUEST_USER_TO_MERCHANT_QUERY);
        statement.setInt(1, merchant.getIdUser());
        statement.setString(2, merchant.getRestaurantName());
        statement.setString(3, merchant.getNumberPhone());
        statement.setString(4, merchant.getEmail());
        statement.setString(5, merchant.getAddress());
        statement.executeUpdate();
    }

    public Merchant returnIdMerchantByIdUser(int idUser) throws SQLException, ClassNotFoundException {
        Merchant merchant = new Merchant();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select idMerchant from merchant where idUser = ?");
        preparedStatement.setInt(1,idUser);
        ResultSet resultSet =  preparedStatement.executeQuery();
        if (resultSet.next()){
            merchant.setIdMerchant(resultSet.getString("idMerchant"));
        }
        return merchant;
    }

    @Override
    public void createUser(User user) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(CREATE_USER_QUERY);
        callableStatement.setString(1, user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3, user.getPassword());
        callableStatement.executeQuery();
    }

    @Override
    public User checkLoginUser(String username, String password) throws SQLException, ClassNotFoundException {
        User user = null;
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(LOGIN_QUERY);
        callableStatement.setString(1, username);
        callableStatement.setString(2, password);
        ResultSet resultSet = callableStatement.executeQuery();
        if (resultSet.next()) {
            user = new User();
            user.setId(resultSet.getInt("idUser"));
            user.setName(resultSet.getString("name"));
            user.setEmail(resultSet.getString("email"));
            user.setPhoneNumber(resultSet.getString("phoneNumber"));
            user.setPassword(resultSet.getString("password"));
            user.setGender(resultSet.getString("gender"));
            user.setBirthday(resultSet.getString("birth"));
            user.setImg(resultSet.getString("imgUser"));
            user.setAddress(resultSet.getString("address"));
        }
        return user;
    }

    @Override
    public Merchant checkLoginMerchant(int id, String password) throws SQLException, ClassNotFoundException {
        Merchant merchant = new Merchant();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(CHECK_LOGIN_MERCHANT_QUERY);
        callableStatement.setInt(1, id);
        callableStatement.setString(2, password);
        ResultSet resultSet = callableStatement.executeQuery();
        if (resultSet != null && resultSet.next()) {
            merchant.setIdMerchant(resultSet.getString("idMerchant"));
            merchant.setIdUser(resultSet.getInt("idUser"));
            merchant.setRestaurantName(resultSet.getString("restaurantName"));
            merchant.setEmail(resultSet.getString("restaurantEmail"));
            merchant.setNumberPhone(resultSet.getString("restaurantPhoneNumber"));
            merchant.setAddress(resultSet.getString("restaurantAddress"));
        }
        return merchant;
    }

    @Override
    public User findUserById(int id) throws SQLException, ClassNotFoundException {
        User user = null;
        Connection connection = getConnection();
        String query = "select name, email, phoneNumber, gender,birth ,address from user where IdUser =?";
        PreparedStatement callableStatement = connection.prepareStatement(query);
        callableStatement.setInt(1, id);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String phoneNumber = resultSet.getString("phoneNumber");
            String gender = resultSet.getString("gender");
            String birthday = resultSet.getString("birth");
            String address = resultSet.getString("address");
            user = new User(name, email, phoneNumber, gender, birthday, address);
        }
        return user;
    }

    @Override
    public boolean updateUser(User user) throws SQLException, ClassNotFoundException {
        boolean rowUpdated;
        Connection connection = getConnection();

        CallableStatement callableStatement = connection.prepareCall(UPDATE_PROFILE_USER);
        callableStatement.setInt(1, user.getId());
        callableStatement.setString(2, user.getName());
        callableStatement.setString(3, user.getGender());
        callableStatement.setString(4, user.getPhoneNumber());
        callableStatement.setString(5, user.getBirthday());
        callableStatement.setString(6, user.getImg());
        callableStatement.setString(7, user.getAddress());

        rowUpdated = callableStatement.executeUpdate() > 0;

        return rowUpdated;
    }

    @Override
    public List<Product> get_All_Product() throws SQLException, ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_ALL_PRODUCT);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            String idProduct = resultSet.getString("idProduct");
            String idMerchant = resultSet.getString("idMerchant");
            String productName = resultSet.getString("productName");
            String restaurantName = resultSet.getString("restaurantName");
            String productImg = resultSet.getString("productImg");
            int waitTime = resultSet.getInt("waitTime");
            int price = resultSet.getInt("price");
            int sale = resultSet.getInt("sale");
            String address = resultSet.getString("restaurantAddress");
            productList.add(new Product(idProduct, idMerchant, productName, restaurantName, productImg, waitTime, price, sale, address));
        }
        return productList;
    }

    public Merchant getAllMerchant(String idMerchantIput) throws SQLException, ClassNotFoundException {
        Merchant merchant = new Merchant();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_RESTAURANT_MERCHANT_QUERY);
        callableStatement.setString(1, idMerchantIput);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            int idUser = resultSet.getInt("idUser");
            String idMerchant = resultSet.getString("idMerchant");
            String name = resultSet.getString("restaurantName");
            String phoneNumber = resultSet.getString("restaurantPhoneNumber");
            String email = resultSet.getString("restaurantEmail");
            String address = resultSet.getString("restaurantAddress");
            String status = resultSet.getString("status");
            merchant = new Merchant(idUser, idMerchant, name, phoneNumber, email, address, status);
        }
        return merchant;
    }

    public List<Merchant> showMerchant() throws SQLException, ClassNotFoundException {
        List<Merchant> merchantList = new ArrayList<>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(SHOW_MERCHANT_QUERY);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            int idUser = resultSet.getInt("idUser");
            String idMerchant = resultSet.getString("idMerchant");
            String name = resultSet.getString("restaurantName");
            String phoneNumber = resultSet.getString("restaurantPhoneNumber");
            String email = resultSet.getString("restaurantEmail");
            String address = resultSet.getString("restaurantAddress");
            String status = resultSet.getString("status");
            merchantList.add(new Merchant(idUser, idMerchant, name, phoneNumber, email, address, status));
        }
        return merchantList;
    }

    public void createAddress(int idUser, String name, String phone, String address) {
        try {
            Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(CREATE_ADDRESS_QUERY);
            callableStatement.setInt(1, idUser);
            callableStatement.setString(2, name);
            callableStatement.setString(3, phone);
            callableStatement.setString(4, address);
            callableStatement.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<DeliveryAddress> getAllUserAddress(int idUser) throws SQLException, ClassNotFoundException {
        List<DeliveryAddress> addressList = new ArrayList<>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_ALL_USER_ADDRESS_QUERY);
        callableStatement.setInt(1, idUser);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            int idAddress = resultSet.getInt("idAddress");
            int idU = resultSet.getInt("idUser");
            String recipientName = resultSet.getString("recipientName");
            String recipientPhone = resultSet.getString("recipientPhone");
            String detailedAddress = resultSet.getString("detailedAddress");

            addressList.add(new DeliveryAddress(idAddress, idU,recipientName, recipientPhone, detailedAddress));
        }
        return addressList;
    }
    public void updateAddress(DeliveryAddress deliveryAddress) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(UPDATE_ADDRESS_QUERY);
        callableStatement.setInt(1,deliveryAddress.getIdAddress());
        callableStatement.setString(2,deliveryAddress.getRecipientName());
        callableStatement.setString(3,deliveryAddress.getRecipientPhone());
        callableStatement.setString(4,deliveryAddress.getDetailedAddress());
        callableStatement.executeUpdate();
    }
}
