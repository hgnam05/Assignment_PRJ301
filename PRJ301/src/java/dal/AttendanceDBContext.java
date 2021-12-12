/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Attendance;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author namdh
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public void insert(ArrayList<Attendance> atts) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [Attendance]\n"
                    + "           ([sid]\n"
                    + "           ,[adate]\n"
                    + "           ,[tid]\n"
                    + "           ,[present])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?)";
            for (Attendance att : atts) {
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, att.getSid());
                stm.setDate(2, att.getAdate());
                stm.setInt(3, att.getTid());
                stm.setBoolean(4, att.isPresent());
                stm.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
