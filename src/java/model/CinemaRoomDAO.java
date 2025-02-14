/*
 * CinemaRoomDAO
 */
package model;


import entity.CinemaRoom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CinemaRoomDAO extends DBConnection {
    public List<CinemaRoom> getAllCinemaRooms() {
        List<CinemaRoom> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM CinemaRoom";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CinemaRoom room = new CinemaRoom();
                room.setRoomID(rs.getInt("RoomID"));
                room.setCinemaID(rs.getInt("CinemaID"));
                room.setRoomName(rs.getString("RoomName"));
                list.add(room);
            }
        } catch (Exception ex) {
            Logger.getLogger(CinemaRoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<CinemaRoom> getRoomsByCinemaID(int cinemaID) {
        List<CinemaRoom> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM CinemaRoom WHERE CinemaID = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, cinemaID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CinemaRoom room = new CinemaRoom();
                room.setRoomID(rs.getInt("RoomID"));
                room.setCinemaID(rs.getInt("CinemaID"));
                room.setRoomName(rs.getString("RoomName"));
                list.add(room);
            }
        } catch (Exception ex) {
            Logger.getLogger(CinemaRoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
