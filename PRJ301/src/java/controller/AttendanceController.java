/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AttendanceDBContext;
import dal.ClassDBContext;
import dal.StudentDBContext;
import dal.TimeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Attendance;
import model.ClassEntity;
import model.Student;
import model.Time;

/**
 *
 * @author namdh
 */
public class AttendanceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        StudentDBContext sdb = new StudentDBContext();
        ClassDBContext cdb = new ClassDBContext();
        TimeDBContext tdb = new TimeDBContext();
        ArrayList<Time> times = tdb.getAll();
        ClassEntity c = cdb.getClassById(cid);
        ArrayList<Student> students = sdb.getStudentByClass(cid);
        request.setAttribute("students", students);
        request.setAttribute("class", c);
        request.setAttribute("times", times);
        request.getRequestDispatcher("attendance.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date date = Date.valueOf(request.getParameter("date"));
        int tid = Integer.parseInt(request.getParameter("tid"));
        String[] sids = request.getParameterValues("id");
        ArrayList<Attendance> atts = new ArrayList<>();
        for (String id : sids) {
            Attendance at = new Attendance();
            at.setSid(Integer.parseInt(id));
            at.setAdate(date);
            at.setTid(tid);
            at.setPresent(request.getParameter("present"+id)!=null);
            atts.add(at);
        }
        AttendanceDBContext db = new AttendanceDBContext();
        db.insert(atts);
        response.getWriter().println("Done"); 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
