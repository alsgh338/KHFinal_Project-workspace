<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 작성</title>
<!-- 부트스트랩 CSS 추가 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    .content-area,
    .content-area > div:not(.content-main) {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .content-title {
        height: 320px;
        background: url(resources/images/event-header.jpg) no-repeat center center;
        background-size: cover;
        text-align: center;
        line-height: 320px;
        font-size: 50px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        color: white;
        width: 100%;
        margin-bottom: 20px;
    }

    .content-subtitle {
        width: 100%;
        max-width: 1400px;
        line-height: 120px;
        font-size: 30px;
        font-weight: 600;
        text-align: center;
        color: #343a40;
        margin-bottom: 20px;
    }

    .content-main {
        width: 100%;
        max-width: 1400px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    form#enrollForm {
        width: 100%;
        max-width: 1200px;
    }

    table {
        width: 100%;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
    }

    th {
        text-align: left;
        width: 20%;
        color: #343a40;
    }

    td {
        width: 80%;
    }

    label {
        font-weight: bold;
    }

    .form-control, .form-control-file {
        border: 1px solid #ced4da;
        border-radius: 5px;
    }

    .btn-primary, .btn-danger, .btn-secondary {
        width: 150px;
        margin: 10px;
    }

</style>

</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    
    <div class="content-area">
        <div class="content-title" id="home">EVENT</div>
        <div class="content-subtitle">이벤트 작성</div>
        <div class="content-main">
            <form id="enrollForm" method="post" action="insert.ev" enctype="multipart/form-data">
                <table class="table">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="eventTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="date">기간</label></th>
                        <td>
                            <div class="d-flex">
                                <input type="date" id="startDate" class="form-control" name="startDate" style="margin-right: 10px;">
                                <label for="dewDate" style="line-height: 38px; margin-right: 10px;">~</label>
                                <input type="date" id="dewDate" class="form-control" name="dewDate">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="upfileThumbnail">썸네일</label></th>
                        <td><input type="file" id="upfileThumbnail" class="form-control-file" name="upfiles" required></td>
                    </tr>
                    <tr>
                        <th><label for="upfileMain">본문 사진</label></th>
                        <td><input type="file" id="upfileMain" class="form-control-file" name="upfiles" required></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="eventContent" placeholder="미입력시 이미지만 업로드 됩니다."></textarea></td>
                    </tr>
                </table>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <a class="btn btn-secondary" href="list.ev?condition=onGoing">목록으로</a>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

    <!-- 부트스트랩 JS 추가 (필요한 경우) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>