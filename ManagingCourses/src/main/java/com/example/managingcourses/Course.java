package com.example.managingcourses;

import java.util.ArrayList;

public class Course {
    private int id;
    private String name;
    private String date;
    private int duration;
    private String level;
    private double price;
    private ArrayList<Student> students;

    public Course(){}

    public Course(int id, String name, String date, int duration, String level, double price) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.duration = duration;
        this.level = level;
        this.price = price;
        students = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    public void addStudent(Student st){
        students.add(st);
    }

    public void removeStudent(Student st){
        students.remove(st);
    }

    public static ArrayList<Course> generateData(){
        ArrayList<Course> courses = new ArrayList<>();
        courses.add(new Course(1234, "C# Programming", "01/02/2024", 12, "Beginner", 5000));
        courses.add(new Course(9785, "C# Programming", "10/02/2024", 10, "Advanced", 7500));
        courses.add(new Course(6542, "Python Programming", "01/05/2024", 11, "Beginner", 6500));
        courses.add(new Course(3481, "Python Programming", "11/05/2024", 10, "Advanced", 6000));
        courses.add(new Course(9513, "Machine Learning", "10/01/2024", 15, "Beginner", 2000));
        return courses;
    }
}
