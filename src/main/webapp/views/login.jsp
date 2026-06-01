<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 400px; margin: 60px auto; padding: 20px; }
        h2 { color: #2c3e50; }
        label { display: block; margin-top: 12px; font-weight: bold; }
        input[type=text], input[type=password] {
            width: 100%; padding: 8px; margin-top: 4px;
            border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
        }
        button { margin-top: 16px; padding: 10px 24px; background: #3498db;
                 color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #2980b9; }
        .message { margin-top: 14px; padding: 10px; border-radius: 4px;
                   background: #eaf4fb; border-left: 4px solid #3498db; color: #2c3e50; }
        .back { display: inline-block; margin-top: 20px; color: #3498db; text-decoration: none; }
    </style>
</head>
<body>
    <h2>Đăng Nhập</h2>
    <c:url value="/account/login" var="url"/>
    <form action="${url}" method="post">
        <label>Tên đăng nhập:</label>
        <input type="text" name="username" placeholder="Nhập username">
        <label>Mật khẩu:</label>
        <input type="password" name="password" placeholder="Nhập password">
        <button type="submit">Login</button>
    </form>
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    <a class="back" href="<c:url value='/'/>">← Về trang chủ</a>
</body>
</html>
