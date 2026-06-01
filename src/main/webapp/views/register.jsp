<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Thành Viên</title>
    <style>
        body { font-family: "Times New Roman", serif; max-width: 550px; margin: 40px auto; padding: 20px; }
        h1 { font-size: 2em; margin-bottom: 20px; }
        .row { margin: 8px 0; display: flex; align-items: center; flex-wrap: wrap; }
        .row label.lbl { width: 110px; }
        input[type=text], input[type=password] {
            padding: 4px 6px; border: 1px solid #999; border-radius: 2px;
            width: 220px;
        }
        select { padding: 4px 6px; border: 1px solid #999; border-radius: 2px; }
        textarea { width: 220px; height: 80px; padding: 4px; border: 1px solid #999; }
        .radio-group, .check-group { display: flex; align-items: center; gap: 12px; flex-wrap: wrap; }
        hr { margin: 20px 0; border: none; border-top: 1px solid #ccc; }
        button[type=submit] { padding: 6px 18px; background: #f0f0f0;
                              border: 1px solid #999; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button[type=submit]:hover { background: #ddd; }
        .message { margin-top: 16px; padding: 12px; background: #eaf4fb;
                   border-left: 4px solid #3498db; border-radius: 4px; }
        .back { display: inline-block; margin-top: 20px; color: #3498db; text-decoration: none; font-family: Arial, sans-serif; }
    </style>
</head>
<body>
    <h1>Đăng Ký</h1>
    <c:url value="/dang-ky" var="url"/>
    <form action="${url}" method="post">
        <div class="row">
            <label class="lbl">Tên đăng nhập:</label>
            <input type="text" name="username">
        </div>
        <div class="row">
            <label class="lbl">Mật khẩu:</label>
            <input type="password" name="password">
        </div>
        <div class="row">
            <label class="lbl">Giới tính:</label>
            <div class="radio-group">
                <label><input type="radio" name="gender" value="Nam" checked> Nam</label>
                <label><input type="radio" name="gender" value="Nữ"> Nữ</label>
            </div>
        </div>
        <div class="row">
            <label class="lbl"></label>
            <label><input type="checkbox" name="married" value="yes"> Đã có gia đình?</label>
        </div>
        <div class="row">
            <label class="lbl">Quốc tịch:</label>
            <select name="country">
                <option value="US">United States</option>
                <option value="VN">Việt Nam</option>
                <option value="JP">Japan</option>
                <option value="KR">Korea</option>
                <option value="CN">China</option>
            </select>
        </div>
        <div class="row">
            <label class="lbl">Sở thích:</label>
            <div class="check-group">
                <label><input type="checkbox" name="hobbies" value="Đọc sách"> Đọc sách</label>
                <label><input type="checkbox" name="hobbies" value="Du lịch" checked> Du lịch</label>
                <label><input type="checkbox" name="hobbies" value="Âm nhạc" checked> Âm nhạc</label>
                <label><input type="checkbox" name="hobbies" value="Khác"> Khác</label>
            </div>
        </div>
        <div class="row">
            <label class="lbl">Ghi chú:</label>
            <textarea name="note"></textarea>
        </div>
        <hr>
        <button type="submit">Đăng ký</button>
    </form>

    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    <a class="back" href="<c:url value='/'/>">← Về trang chủ</a>
</body>
</html>
