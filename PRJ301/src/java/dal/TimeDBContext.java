/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ClassEntity;
import model.Time;

/**
 *
 * @author namdh
 */
public class TimeDBContext extends DBContext<Time>{
    
    public ArrayList<Time> getAll() {
        ArrayList<Time> times = new ArrayList<>();
        try {
            String sql = "SELECT [tid]\n"
                    + "      ,[tname]\n"
                    + "  FROM [Time]\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Time t = new Time();
                t.setTid(rs.getInt("tid"));
                t.setTname(rs.getString("tname"));
                times.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return times;
    }
    public Time getTimeById(int id) {
        Time t = new Time();
        try {
            String sql = "SELECT [tid]\n"
                    + "      ,[tname]\n"
                    + "     FROM [Time]\n"
                    + "     WHERE [tid]= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {               
                t.setTid(rs.getInt("tid"));
                t.setTname(rs.getString("tname"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }
}
