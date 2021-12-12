<%-- 
    Document   : view
    Created on : Dec 12, 2021, 3:34:59 PM
    Author     : namdh
--%>

<%@page import="model.Time"%>
<%@page import="model.ClassEntity"%>
<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Attendance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Attendance> attendances = (ArrayList<Attendance>) request.getAttribute("attAdded");
            ArrayList<Student> stds = (ArrayList<Student>) request.getAttribute("stds");
            ClassEntity c = (ClassEntity) request.getAttribute("attClass");
            Time t = (Time) request.getAttribute("attTime");
        %>
    </head>
    <body>
        <h1><%= c.getName() %></h1>
        <h1><%= t.getTname() %></h1>
        <h1><%= attendances.get(0).getAdate()%></h1>
        <table>
                <tr>
                    <th>Student name </th>
                    <th>Present</th>
                </tr>
                <% for (Student s : stds) {
                %>
                <tr>
                    <td><%=s.getSname()%></td>
                    <td style="text-align: center;">
                        <% boolean isPresent = false;
                            for (Attendance a : attendances){
                                if(a.getSid()==s.getSid()){
                                    isPresent = a.isPresent();
                                }
                            }%>
                            <div>
                                <%= isPresent?"attended": "absent" %>
                            </div>
                    </td>
                </tr>
                <%}%>
            </table>
    </body>
</html>
