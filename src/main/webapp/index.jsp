<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lab 4 - Lập Trình Web Cơ Bản</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 40px auto; padding: 20px; }
        h1 { color: #2c3e50; }
        ul { list-style: none; padding: 0; }
        li { margin: 10px 0; }
        a { display: inline-block; padding: 10px 20px; background: #3498db;
            color: white; text-decoration: none; border-radius: 5px; width: 280px; }
        a:hover { background: #2980b9; }
    </style>
</head>
<body>
    <h1>Lab 4 - Lập Trình Web Cơ Bản</h1>
    <ul>
        <li><a href="<c:url value='/account/login'/>">Bài 1: Phân biệt POST và GET (Login)</a></li>
        <li><a href="<c:url value='/calculate/add'/>">Bài 2: Xử lý form nhiều nút (Calculator)</a></li>
        <li><a href="<c:url value='/dang-ky'/>">Bài 3: Đọc tham số (Đăng ký)</a></li>
        <li><a href="<c:url value='/upload'/>">Bài 4: Upload file</a></li>
    </ul>
</body>
</html>
