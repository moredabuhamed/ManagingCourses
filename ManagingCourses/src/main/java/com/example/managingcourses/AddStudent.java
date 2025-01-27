package com.example.managingcourses;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.XMLEncoder;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddStudent", value = "/AddStudent")
public class AddStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("save")!=null) {
            ArrayList<Course> courses = (ArrayList<Course>) getServletContext().getAttribute("courses");
            String filePath = getServletContext().getRealPath("/") + "courses.xml";
            FileOutputStream fos = new FileOutputStream(filePath);
            XMLEncoder xe = new XMLEncoder(fos);
            for (Course c : courses) {
                xe.writeObject(c);
            }
            xe.close();
            String message = "The list is saved successfully!";
            request.getRequestDispatcher("Course_homepage.jsp?message=" + message).forward(request, response);

        }
        else if(request.getParameter("logout")!=null){
            request.getSession().invalidate();
            request.getRequestDispatcher("Login.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneNumber = request.getParameter("phoneNumber");
        String otp = request.getParameter("otp");
        if(phoneNumber.equals("123456") && otp.equals("123")){
            request.getSession().setAttribute("logged_in", "ok");
            request.getRequestDispatcher("Course_homepage.jsp").forward(request,response);
        }else{
            String msg = "Phone number or OTP is incorrect, please try again";
            request.getRequestDispatcher("Login.jsp?msg="+msg).forward(request,response);
        }
    }
}
