<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Máy tính</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 400px; margin: 60px auto; padding: 20px; }
        h2 { color: #2c3e50; }
        label { display: block; margin-top: 12px; font-weight: bold; }
        input[type=text] {
            width: 100%; padding: 8px; margin-top: 4px;
            border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
        }
        .btn-group { margin-top: 16px; display: flex; gap: 10px; }
        button { padding: 10px 30px; color: white; border: none;
                 border-radius: 4px; cursor: pointer; font-size: 18px; font-weight: bold; }
        .btn-add { background: #27ae60; }
        .btn-add:hover { background: #219a52; }
        .btn-sub { background: #e74c3c; }
        .btn-sub:hover { background: #c0392b; }
        .message { margin-top: 14px; padding: 10px; border-radius: 4px;
                   background: #eaf4fb; border-left: 4px solid #27ae60; color: #2c3e50; font-size: 16px; }
        .back { display: inline-block; margin-top: 20px; color: #3498db; text-decoration: none; }
    </style>
</head>
<body>
    <h2>Máy Tính Đơn Giản</h2>
    <c:url value="/calculate" var="cal"/>
    <form method="post">
        <label>Số a:</label>
        <input type="text" name="a" placeholder="Nhập số thứ nhất">
        <label>Số b:</label>
        <input type="text" name="b" placeholder="Nhập số thứ hai">
        <div class="btn-group">
            <button class="btn-add" formaction="${cal}/add">+</button>
            <button class="btn-sub" formaction="${cal}/sub">-</button>
        </div>
    </form>
    <c:if test="${not empty message}">
        <div class="message">Kết quả: ${message}</div>
    </c:if>
    <a class="back" href="<c:url value='/'/>">← Về trang chủ</a>
</body>
</html>
