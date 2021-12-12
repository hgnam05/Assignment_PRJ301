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
import model.Student;

/**
 *
 * @author namdh
 */
public class StudentDBContext extends DBContext<Student> {

    public ArrayList<Student> getStudentByClass(int id) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT s.sid,s.sname,s.gender,s.dob,c.cid, c.name\n"
                    + "FROM Student s \n"
                    + "INNER JOIN Class c ON s.cid = c.cid\n"
                    + "WHERE c.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                s.setCid(id);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
}
