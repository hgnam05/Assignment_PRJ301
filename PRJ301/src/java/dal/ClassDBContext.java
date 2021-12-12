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

/**
 *
 * @author namdh
 */
public class ClassDBContext extends DBContext<ClassEntity> {

    public ArrayList<ClassEntity> getAll() {
        ArrayList<ClassEntity> classes = new ArrayList<>();
        try {
            String sql = "SELECT [cid]\n"
                    + "      ,[name]\n"
                    + "  FROM [Class]\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ClassEntity c = new ClassEntity();
                c.setCid(rs.getInt("cid"));
                c.setName(rs.getString("name"));
                classes.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return classes;
    }

    public ClassEntity getClassById(int id) {
        try {
            String sql = "SELECT [cid]\n"
                    + "      ,[name]\n"
                    + "  FROM [Class]\n"
                    + "WHERE [cid] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            ClassEntity c = new ClassEntity();
            while (rs.next()) {
                c.setCid(rs.getInt("cid"));
                c.setName(rs.getString("name"));
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
