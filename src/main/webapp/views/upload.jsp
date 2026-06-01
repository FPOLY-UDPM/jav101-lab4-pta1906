<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Upload File</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 450px; margin: 60px auto; padding: 20px; }
        h2 { color: #2c3e50; }
        input[type=file] { margin: 14px 0; display: block; }
        button { padding: 10px 24px; background: #8e44ad; color: white;
                 border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #6c3483; }
        .message { margin-top: 14px; padding: 10px; border-radius: 4px;
                   background: #f5eef8; border-left: 4px solid #8e44ad; color: #2c3e50; }
        .preview img { margin-top: 14px; max-width: 300px; border: 1px solid #ccc; border-radius: 4px; }
        .back { display: inline-block; margin-top: 20px; color: #3498db; text-decoration: none; }
    </style>
</head>
<body>
    <h2>Upload File Hình Ảnh</h2>
    <c:url value="/upload" var="url"/>
    <form action="${url}" method="post" enctype="multipart/form-data">
        <input name="photo" type="file" accept="image/*">
        <button type="submit">Upload</button>
    </form>

    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    <c:if test="${not empty uploadedFile}">
        <div class="preview">
            <p>Xem trước:</p>
            <img src="<c:url value='/static/files/${uploadedFile}'/>" alt="Uploaded image">
        </div>
    </c:if>
    <a class="back" href="<c:url value='/'/>">← Về trang chủ</a>
</body>
</html>
