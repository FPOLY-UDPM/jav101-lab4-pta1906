package com.fpoly.lab4.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;

@WebServlet("/dang-ky")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // Đọc tham số đơn trị
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String gender   = req.getParameter("gender");
        String married  = req.getParameter("married");
        String country  = req.getParameter("country");
        String note     = req.getParameter("note");

        // Đọc tham số đa trị (checkboxes)
        String[] hobbies = req.getParameterValues("hobbies");

        // In ra console để kiểm tra
        System.out.println("=== ĐĂNG KÝ THÀNH VIÊN ===");
        System.out.println("Username : " + username);
        System.out.println("Password : " + password);
        System.out.println("Giới tính: " + gender);
        System.out.println("Gia đình : " + (married != null ? "Đã có gia đình" : "Chưa có gia đình"));
        System.out.println("Quốc tịch: " + country);
        System.out.println("Sở thích : " + (hobbies != null ? Arrays.toString(hobbies) : "Không có"));
        System.out.println("Ghi chú  : " + note);
        System.out.println("==========================");

        // Tạo thông báo kết quả
        String hobbiesStr = (hobbies != null) ? String.join(", ", hobbies) : "Không có";
        String marriedStr = (married != null) ? "Đã có gia đình" : "Chưa có gia đình";

        String message = String.format(
            "Đăng ký thành công! Thông tin: [Username: %s] [Giới tính: %s] [%s] [Quốc tịch: %s] [Sở thích: %s]",
            username, gender, marriedStr, country, hobbiesStr
        );

        req.setAttribute("message", message);
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }
}
