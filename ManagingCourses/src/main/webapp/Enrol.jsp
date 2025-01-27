<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.managingcourses.Course" %>
<%@ page import="com.example.managingcourses.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enroll Student</title>
    <link rel="stylesheet" href="css/Enrol.css">
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
            }
        }
        if (request.getParameter("Sname") != null) {
            Course course;
            for (int i = 0; i < courses.size(); i++) {
                if (courses.get(i).getId() == courseId) {
                    course = courses.get(i);
                    String sName = request.getParameter("Sname");
                    int id = Integer.parseInt(request.getParameter("id"));
                    Student st = new Student(id, sName);
                    course.addStudent(st);
                    courses.set(i, course);
                    String msg = "Course registered for " + sName;
                    request.getRequestDispatcher("Course_homepage.jsp?message=" + msg).forward(request, response);
                    break;
                }
            }
        }
    %>
    <h1>Enroll Student</h1>
    <h3>Course Details</h3>
    <table>
        <tr>
            <th>Course ID</th>
            <th>Name</th>
            <th>Starting Date</th>
            <th>Duration</th>
            <th>Level</th>
            <th>Price</th>
        </tr>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getDate() %></td>
            <td><%= c.getDuration() %> weeks</td>
            <td><%= c.getLevel() %></td>
            <td><%= c.getPrice() %> HUF</td>
        </tr>
    </table>
    <h3>Enter Student Details</h3>
    <form method="post" action="">
        <label for="id">Student ID:</label>
        <input type="number" id="id" name="id" value="0" required>
        <label for="Sname">Student Name:</label>
        <input type="text" id="Sname" name="Sname" required>
        <input type="submit" value="Enroll">
    </form>
</div>
</body>
</html>
