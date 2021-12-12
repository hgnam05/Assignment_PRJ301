<%-- 
    Document   : home
    Created on : Dec 12, 2021, 10:13:16 AM
    Author     : namdh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.ClassEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<ClassEntity> classes = (ArrayList<ClassEntity>) request.getAttribute("classes");
        %>
    </head>
    <body>
        <table>
            <tr>
                <th>Class Name: </th>
                <th></th>
            </tr>
            <% for (ClassEntity c : classes) {
            %>
            <tr>
                <td><%=c.getName()%></td>
                <td><a href="attendance?cid=<%=c.getCid()%>">Attendance</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
