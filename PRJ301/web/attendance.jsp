<%-- 
    Document   : attendance
    Created on : Dec 12, 2021, 1:49:49 PM
    Author     : namdh
--%>

<%@page import="model.Time"%>
<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClassEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("students");
            ArrayList<Time> times = (ArrayList<Time>) request.getAttribute("times");
            ClassEntity c = (ClassEntity) request.getAttribute("class");
        %>
    </head>
    <body>
        <h1><%= c.getName()%></h1>
        <form method="post" style="margin: 0 auto">
            <div style="display: flex">
                Time: <select name="tid" style="margin-right: 10px">
                    <% for (Time t : times) {
                    %>
                    <option value="<%=t.getTid()%>"><%=t.getTname()%></option>
                    <%}%>
                </select>
                Date: <input type="date" name="date"/>
            </div>
            <table>
                <tr>
                    <th>Student name </th>
                    <th>Present</th>
                </tr>
                <% for (Student s : students) {
                %>
                <tr>
                    <td><%=s.getSname()%><input type="hidden" value="<%= s.getSid()%>" name="id" /></td>
                    <td style="text-align: center;"><input type="checkbox" name="present<%=s.getSid()%>" value="present" /></td>
                </tr>
                <%}%>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
