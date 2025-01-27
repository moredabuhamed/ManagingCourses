<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.managingcourses.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Homepage - Course Management</title>
  <link rel="stylesheet" href="css/Course_homepage.css">
</head>
<body>
<div class="container">
  <h1>Available Courses</h1>
  <%
    if (getServletContext().getAttribute("courses") == null) {
      ArrayList<Course> courses = Course.generateData();
      getServletContext().setAttribute("courses", courses);
    }
    ArrayList<Course> courses = (ArrayList<Course>) getServletContext().getAttribute("courses");
  %>
  <table>
    <tr>
      <th>#</th>
      <th>Course ID</th>
      <th>Name</th>
      <th>Starting Date</th>
      <th>Duration</th>
      <th>Level</th>
      <th>Price</th>
      <th>Enroll</th>
      <th>No. of Students</th>
    </tr>
    <%
      Course c = null;
      for (int i = 0; i < courses.size(); i++) {
        c = courses.get(i);
    %>
    <tr>
      <td><%=(i + 1)%></td>
      <td><%=c.getId()%></td>
      <td><%=c.getName()%></td>
      <td><%=c.getDate()%></td>
      <td><%=c.getDuration()%> weeks</td>
      <td><%=c.getLevel()%></td>
      <td><%=c.getPrice()%> HUF</td>
      <td><a href="Enrol.jsp?course=<%=c.getId()%>">Enroll</a></td>
      <td><a href="ListStudent.jsp?course=<%=c.getId()%>"><%=c.getStudents().size()%></a></td>
    </tr>
    <%
      }
    %>
  </table>
  <div class="actions">
    <a href="AddStudent?save=2" class="save-link">Save the list to a file!</a>
    <% if (session.getAttribute("logged_in") != null) { %>
    <a href="AddStudent?logout=1" class="logout-link">Logout</a>
    <% } %>
  </div>
  <% if (request.getParameter("message") != null) { %>
  <h4><%= request.getParameter("message") %></h4>
  <% } %>
</div>
</body>
</html>
