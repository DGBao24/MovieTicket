/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import model.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.Cinema;
import entity.Movie;


public class CinemaDAO extends DBConnection {
    public List<Cinema> getAllCinemas() {
        List<Cinema> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cinema";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cinema cinema = new Cinema();
                cinema.setCinemaID(rs.getInt("CinemaID"));
                cinema.setCinemaName(rs.getString("CinemaName"));
                cinema.setAddress(rs.getString("Address"));
                list.add(cinema);
            }
        } catch (Exception ex) {
            Logger.getLogger(CinemaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        CinemaDAO dao = new CinemaDAO();
        List<Cinema> list = dao.getAllCinemas();
        for (Cinema movie : list) {
            System.out.println(movie);
        }
    }
    
}
