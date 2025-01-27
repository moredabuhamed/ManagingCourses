<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.managingcourses.Course" %>
<%@ page import="com.example.managingcourses.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
    <link rel="stylesheet" href="css/ListStudent.css">
</head>
<body>
<div class="container">
    <%
        if (session.getAttribute("logged_in") == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        ArrayList<Course> courses = (ArrayList<Course>) getServletContext().getAttribute("courses");
        int courseId = Integer.parseInt(request.getParameter("course"));
        Course c = null;
        for (Course course : courses) {
            if (course.getId() == courseId) {
                c = course;
                break;
            }
        }
        ArrayList<Student> students = c.getStudents();
    %>
    <h1>Student List</h1>
    <h3>Course: <%= c.getName() %> (<%= c.getId() %>)</h3>
    <table>
        <thead>
        <tr>
            <th>No.</th>
            <th>Student ID</th>
            <th>Student Name</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < students.size(); i++) {
                Student s = students.get(i);
        %>
        <tr>
            <td><%= (i + 1) %></td>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <a href="Course_homepage.jsp" class="back-link">Back to Homepage</a>
</div>
</body>
</html>
