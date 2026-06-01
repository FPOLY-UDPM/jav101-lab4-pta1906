package com.fpoly.lab4.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({"/calculate/add", "/calculate/sub"})
public class CalculateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("message", "Nhập số và chọn phép tính");
        req.getRequestDispatcher("/views/calculate.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String a = req.getParameter("a");
        String b = req.getParameter("b");
        String path = req.getServletPath();
        String message;

        try {
            double numA = Double.parseDouble(a);
            double numB = Double.parseDouble(b);

            if (path.endsWith("/add")) {
                double c = numA + numB;
                message = a + " + " + b + " = " + c;
            } else {
                double c = numA - numB;
                message = a + " - " + b + " = " + c;
            }
        } catch (NumberFormatException e) {
            message = "Lỗi: Vui lòng nhập số hợp lệ!";
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("/views/calculate.jsp").forward(req, resp);
    }
}
