package com.example.webwhatforlunch.service;

import com.example.webwhatforlunch.model.Bill;
import com.example.webwhatforlunch.model.Product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {
    private String username = "root";

    private String password = "1111";

    private String jdbcURL = "jdbc:mysql://localhost:3306/WebWhatForLunch";

    private static final String GET_BILL_USER = "CALL GET_BILL_USER(?)";
    private static final String GET_BILL_ID = "CALL GET_BILL_BY_ID(?)";
    private static final String GET_PRODUCT_IN_BILL = "CALL GET_PRODUCT_IN_BILL(?)";
    private static final String GET_BILL_MERCHANT = "CALL GET_BILL_MERCHANT(?)";
    private static final String CREATE_BILL_QUERY = "CALl CREATE_BILL(?,?,?,?,?,?)";
    private static final String ACCEPT_BILL = "CALL ACTIVE_BILL(?,?)";
    private static final String CANCEL_BILL = "CALL CANCEL_BILL(?,?)";
    private static final String ADD_PRODUCT_TO_BILL1_QUERY = "CALL ADD_PRODUCT_TO_BILL(?,?,?,?)";

    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, username, password);
        return connection;
    }

    public int createBill(int idUser,String idMerchant, String recipientName, String recipientPhone, String recipientAddress,String paymentMethods) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(CREATE_BILL_QUERY);
        callableStatement.setInt(1, idUser);
        callableStatement.setString(2, idMerchant);
        callableStatement.setString(3, recipientName);
        callableStatement.setString(4, recipientPhone);
        callableStatement.setString(5, recipientAddress);
        callableStatement.setString(6, paymentMethods);
        ResultSet resultSet = callableStatement.executeQuery();
        resultSet.next();
        return resultSet.getInt(1);
    }

    public void createProductToBill(int idBill, List<Product> products) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(ADD_PRODUCT_TO_BILL1_QUERY);
        for (Product product : products) {
            callableStatement.setInt(1,idBill);
            callableStatement.setString(2, product.getIdProduct());
            callableStatement.setInt(3, product.getQuantity());
            callableStatement.setString(4, product.getNote());
            callableStatement.executeUpdate();
        }
    }

    public List<Bill> getBillMerchant(String idMerchant) {
        List<Bill> billList;
        try {
            billList = getBills(idMerchant, GET_BILL_MERCHANT);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return billList;
    }

    public List<Bill> getBillUser(int idUser) {
        List<Bill> billList;
        try {
            billList = getBills(String.valueOf(idUser), GET_BILL_USER);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return billList;
    }

    private List<Bill> getBills(String id, String QUERY) throws ClassNotFoundException, SQLException {
        Connection connection = getConnection();
        List<Bill> billList = new ArrayList<Bill>();
        CallableStatement callableStatement = connection.prepareCall(QUERY);

        try {
            int idUser = Integer.parseInt(id);
            callableStatement.setInt(1, idUser);
        } catch (NumberFormatException e) {
            callableStatement.setString(1, id);
        } finally {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int idBill = rs.getInt("idBill");
                int idUserDB = rs.getInt("idUser");
                String idMerchant = rs.getString("idMerchant");
                String recipientName = rs.getString("recipientName");
                String recipientPhone = rs.getString("recipientPhone");
                String recipientAddress = rs.getString("recipientAddress");
                String paymentMethod = rs.getString("paymentMethods");
                String billStatus = rs.getString("billStatus");
                String timeOrder = rs.getString("timeOrder");
                String restaurantName = rs.getString("restaurantName");
                String restaurantAddress = rs.getString("restaurantAddress");
                List<Product> product = getProductListInBill(connection, idBill);
                Bill bill = new Bill(idBill, idUserDB, idMerchant, recipientName, recipientPhone, recipientAddress, paymentMethod, billStatus, timeOrder, restaurantName, restaurantAddress, product);
                billList.add(bill);
            }
        }
        return billList;
    }

    public List<Product> getProductListInBill(Connection connection, int idBill) throws SQLException {
        CallableStatement callableStatement = connection.prepareCall(GET_PRODUCT_IN_BILL);
        callableStatement.setInt(1, idBill);
        ResultSet rs = callableStatement.executeQuery();
        List<Product> productList = new ArrayList<>();
        while (rs.next()) {
            String idProduct = rs.getString("idProduct");
            String productImg = rs.getString("productImg");
            String productName = rs.getString("productName");
            String note = rs.getString("note");
            int waitTime = rs.getInt("waitTime");
            int price = rs.getInt("price");
            int sale = rs.getInt("sale");
            int serviceFee = rs.getInt("serviceFee");
            int quantity = rs.getInt("quantity");
            Product product = new Product(idProduct, productName, productImg, waitTime, price, note, sale, serviceFee, quantity);
            productList.add(product);
        }
        return productList;
    }

    private List<Bill> filterIdMerchant(String idBill, List<Bill> billList) {
        List<Bill> listBillFilter = new ArrayList<Bill>();
        if (idBill != null) {
            String pattern = ".*" + idBill + ".*";
            for (Bill bill : billList) {
                if (String.valueOf(bill.getIdBill()).matches(pattern)) {
                    listBillFilter.add(bill);
                }
            }
        } else {
            listBillFilter = billList;
        }
        return listBillFilter;
    }

    private List<Bill> filterUserPhone(String phone, List<Bill> billList) {
        List<Bill> listBillFilter = new ArrayList<Bill>();
        if (phone != null) {
            String pattern = ".*" + phone + ".*";
            for (Bill bill : billList) {
                if (bill.getRecipientPhone().matches(pattern)) {
                    listBillFilter.add(bill);
                }
            }
        } else {
            listBillFilter = billList;
        }
        return listBillFilter;
    }

    private List<Bill> filterUserName(String username, List<Bill> billList) {
        List<Bill> listBillFilter = new ArrayList<Bill>();
        if (username != null) {
            String pattern = ".*" + username + ".*";
            for (Bill bill : billList) {
                if (bill.getRecipientName().matches(pattern)) {
                    listBillFilter.add(bill);
                }
            }
        } else {
            listBillFilter = billList;
        }
        return listBillFilter;
    }

    private List<Bill> filter(String filter, List<Bill> billList) {
        List<Bill> listBillFilter = new ArrayList<Bill>();
        if (filter != null) {
            String pattern = ".*" + filter + ".*";
            for (Bill bill : billList) {
                String[] dataProduct = bill.toString().split("/");
                for (String data : dataProduct) {
                    if (data.matches(pattern)) {
                        listBillFilter.add(bill);
                        break;
                    }
                }
            }
        } else {
            listBillFilter = billList;
        }
        return listBillFilter;
    }

    public List<Bill> searchInMerchantBillList(String idMerchant, String id, String phone, String name, String filter) {
        List<Bill> billList = getBillMerchant(idMerchant);
        billList = filterIdMerchant(id, billList);
        billList = filterUserPhone(phone, billList);
        billList = filterUserName(name, billList);
        billList = filter(filter, billList);
        return billList;
    }

    public void cancelBill(int idBill, int idUser) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(CANCEL_BILL);
        callableStatement.setInt(1, idBill);
        callableStatement.setInt(2, idUser);
        callableStatement.executeUpdate();
    }

    public void acceptBill(int idBill, int idUser) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(ACCEPT_BILL);
        callableStatement.setInt(1, idBill);
        callableStatement.setInt(2, idUser);
        callableStatement.executeUpdate();
    }

    public Bill getBillById(int idBill) throws SQLException, ClassNotFoundException {
        Bill bill = null;
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_BILL_ID);
        callableStatement.setInt(1, idBill);
        ResultSet rs = callableStatement.executeQuery();
        while (rs.next()) {
            int idUserDB = rs.getInt("idUser");
            String idMerchant = rs.getString("idMerchant");
            String recipientName = rs.getString("recipientName");
            String recipientPhone = rs.getString("recipientPhone");
            String recipientAddress = rs.getString("recipientAddress");
            String paymentMethod = rs.getString("paymentMethods");
            String billStatus = rs.getString("billStatus");
            String timeOrder = rs.getString("timeOrder");
            String restaurantName = rs.getString("restaurantName");
            String restaurantAddress = rs.getString("restaurantAddress");
            List<Product> product = getProductListInBill(connection, idBill);
            bill = new Bill(idBill, idUserDB, idMerchant, recipientName, recipientPhone, recipientAddress, paymentMethod, billStatus, timeOrder, restaurantName, restaurantAddress, product);
        }
        return bill;
    }


    public List<Product> getProductListInBill(int idBill) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_PRODUCT_IN_BILL);
        callableStatement.setInt(1, idBill);
        ResultSet rs = callableStatement.executeQuery();
        List<Product> productList = new ArrayList<>();
        while (rs.next()) {
            String idProduct = rs.getString("idProduct");
            String productImg = rs.getString("productImg");
            String productName = rs.getString("productName");
            String note = rs.getString("note");
            int waitTime = rs.getInt("waitTime");
            int price = rs.getInt("price");
            int sale = rs.getInt("sale");
            int serviceFee = rs.getInt("serviceFee");
            int quantity = rs.getInt("quantity");
            Product product = new Product(idProduct, productName, productImg, waitTime, price, note, sale, serviceFee, quantity);
            productList.add(product);
        }
        return productList;
    }


}
