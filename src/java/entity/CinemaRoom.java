/*
 * CinemaRoom Model
 */
package entity;

public class CinemaRoom {
    private int roomID;
    private int cinemaID;
    private String roomName;

    public CinemaRoom() {}

    public CinemaRoom(int roomID, int cinemaID, String roomName) {
        this.roomID = roomID;
        this.cinemaID = cinemaID;
        this.roomName = roomName;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getCinemaID() {
        return cinemaID;
    }

    public void setCinemaID(int cinemaID) {
        this.cinemaID = cinemaID;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
}
