package com.fpoly.lab4.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1 MB
    maxFileSize       = 10 * 1024 * 1024, // 10 MB
    maxRequestSize    = 15 * 1024 * 1024  // 15 MB
)
@WebServlet("/upload")
public class UploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "/static/files/";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/upload.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Part photo = req.getPart("photo");
        String submittedFileName = photo.getSubmittedFileName();

        if (submittedFileName == null || submittedFileName.isEmpty()) {
            req.setAttribute("message", "Lỗi: Vui lòng chọn file để upload!");
            req.getRequestDispatcher("/views/upload.jsp").forward(req, resp);
            return;
        }

        // Lấy đường dẫn vật lý tới thư mục lưu file
        String path = UPLOAD_DIR + submittedFileName;
        String savePath = req.getServletContext().getRealPath(path);

        // Tạo thư mục nếu chưa tồn tại
        File saveDir = new File(req.getServletContext().getRealPath(UPLOAD_DIR));
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }

        // Lưu file
        photo.write(savePath);

        System.out.println("File đã upload: " + submittedFileName);
        System.out.println("Lưu tại: " + savePath);

        req.setAttribute("message", "Upload thành công! File: " + submittedFileName
                + " (" + photo.getSize() + " bytes)");
        req.setAttribute("uploadedFile", submittedFileName);
        req.getRequestDispatcher("/views/upload.jsp").forward(req, resp);
    }
}
