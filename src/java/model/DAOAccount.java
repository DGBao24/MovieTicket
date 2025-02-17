/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Account;
import model.DBConnection;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author pdatt
 */
public class DAOAccount extends DBConnection {

    

    public Account getCustomerByEmailAndPassword(String email, String password) {
        Account customer = null;
        String sql = "SELECT * FROM Account WHERE Email = ? AND Password = ?";
        try {
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                customer = new Account();
                customer.setAccountID(resultSet.getInt("AccountID"));
                customer.setName(resultSet.getString("Name"));
                customer.setEmail(resultSet.getString("Email"));
                customer.setPassword(resultSet.getString("Password"));
                customer.setPhoneNum(resultSet.getString("PhoneNum"));
                customer.setAddress(resultSet.getString("Address"));
                customer.setYearOfBirth(resultSet.getInt("YearOfBirth"));
                customer.setStatus(resultSet.getBoolean("Status"));
                customer.setGender(resultSet.getString("Gender"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }
    
    public boolean isPhoneExist(String phone) {
        try {
            String sql = "SELECT * FROM Account WHERE PhoneNum = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true; // Email already exists
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Email does not exist
    }

    public String getPassword(int cid) {
    String password = null;
    String sql = "SELECT Password FROM Account WHERE AccountID = ?";

    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, cid);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                password = rs.getString("Password");
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, "Lỗi khi lấy mật khẩu: " + ex.getMessage(), ex);
    }

    return password;
}

public int updatePassword(int cid, String newPass) {
    int n = 0;
    String sql = "UPDATE Account SET Password = ? WHERE AccountID = ?";

    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, newPass); // Nếu có bcrypt, dùng BCrypt.hashpw(newPass, BCrypt.gensalt())
        ps.setInt(2, cid);
        n = ps.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, "Lỗi khi cập nhật mật khẩu: " + ex.getMessage(), ex);
    }
    return n;
}


    public Account getAccountById(int id) {
    String sql = "SELECT * FROM Account WHERE AccountID = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Account(
                rs.getInt("AccountID"),
                rs.getString("Name"),
                rs.getString("Email"),
                rs.getString("Password"),
                rs.getString("PhoneNum"),
                rs.getString("Address"),
                rs.getInt("YearOfBirth"),
                rs.getBoolean("Status"),
                rs.getString("Role"),
                rs.getString("Gender"));
            
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}


    public boolean isEmailExist(String email) {
    try {
        String sql = "SELECT * FROM Account WHERE email = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            return true; 
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false; 
}

    public int updateCustomer(Account acc) {
    int result = 0;
    String sql = "UPDATE Account SET Name=?, PhoneNum=?, Address=?, YearOfBirth=? ,Gender=? WHERE AccountID=?";
    try{
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, acc.getName());
        ps.setString(2, acc.getPhoneNum());
        ps.setString(3, acc.getAddress());
        ps.setInt(4, acc.getYearOfBirth());
        ps.setString(5, acc.getGender());
        ps.setInt(6, acc.getAccountID());

        result = ps.executeUpdate();
        System.out.println("Update executed, affected rows: " + result); 
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return result;
}



    public int createAccount(Account customer) {
        int affectedRow = 0;
        String sql = "INSERT INTO Account (Name, Email, Password, PhoneNum, Address, YearOfBirth, Status, Role, Gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getPassword());
            preparedStatement.setString(4, customer.getPhoneNum());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.setInt(6, customer.getYearOfBirth());
            preparedStatement.setBoolean(7, customer.isStatus());
            preparedStatement.setString(8, customer.getRole());
            preparedStatement.setString(9, customer.getGender());
            affectedRow = preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return affectedRow;
    }

    public Account AccountLogin(String email, String password) {
        Account customer = null;
        String sql = "SELECT * FROM Account WHERE Email = ? AND Password = ?";
        try {
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                customer = new Account();
                customer.setAccountID(resultSet.getInt("AccountID"));
                customer.setName(resultSet.getString("Name"));
                customer.setEmail(resultSet.getString("Email"));
                customer.setPassword(resultSet.getString("Password"));
                customer.setPhoneNum(resultSet.getString("PhoneNum"));
                customer.setAddress(resultSet.getString("Address"));
                customer.setYearOfBirth(resultSet.getInt("YearOfBirth"));
                customer.setStatus(resultSet.getBoolean("Status"));
                customer.setRole(resultSet.getString("Role"));
                customer.setGender(resultSet.getString("Gender"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }

    public Account getAccountByEmail(String email) {
        String sql = "SELECT Email FROM Account WHERE Email = ?";
        PreparedStatement preparedStatement;
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new Account(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5), 
                        resultSet.getString(6),
                        resultSet.getInt(7), true,
                        resultSet.getString(8),
                        resultSet.getString(9));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public int resetPasswordByEmail(String mail, String newPass) {
        int n = 0;
        String sql = "UPDATE Account SET Password = ? WHERE Email = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPass); // Nếu có bcrypt, dùng BCrypt.hashpw(newPass, BCrypt.gensalt())
            ps.setString(2, mail);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, "Lỗi khi cập nhật mật khẩu: " + ex.getMessage(), ex);
        }
        return n;
    }
    
    public static void main(String[] args) {
        DAOAccount dao = new DAOAccount();
        int n = dao.updateCustomer(new Account(1,"Dat","0987654321","Hung Yen",2003,"Male"));
        if(n>0){
            System.out.println("Successfully");
        }
    }
}
