<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pretendard/0.1.0/pretendard.min.css">
<style>
  
 /* 기본 스타일 설정 */
body {
    margin: 0;
    font-family: 'Pretendard', sans-serif;
}

/* 푸터 스타일 설정 */
footer {
    background-color: #f9f9f9;
    padding: 20px 10px;
    border-top: 1px solid #e0e0e0;
}

footer .flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    max-width: 1200px;
    margin: 0 auto;
}

footer .left, footer .right {
    flex: 1;
    min-width: 300px;
    margin: 10px;
}

footer h2 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #333;
}

footer dd {
    margin: 0 0 10px 0;
    color: #777;
}

footer ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

footer li {
    margin-bottom: 10px;
    color: #555;
}

footer .horizontal-list {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 20px;
}

footer .horizontal-list li {
    margin: 0;
}

footer .horizontal-list a {
    color: #333;
    text-decoration: none;
    transition: color 0.3s;
}

footer .horizontal-list a:hover {
    text-decoration: underline;
    color: #000;
}

footer .company span {
    color: #aaa;
    margin-right: 4px;
}

footer .warning, footer .copy {
    color: #aaa;
    font-size: 12px;
}

footer .copy {
    text-align: center;
    margin-top: 20px;
}


</style>
</head>
<body><footer>
    <section id="bottom">
        <article class="flex">
            <figure class="left">
                <div class="mb20">
                    <dl class="authentic-info" style="cursor: pointer;">
                        <dt><h2 class="text-base">PERSFUME</h2></dt>
                        <dd>퍼스널 향수 브랜드</dd>
                        <span class="tooltiptext"></span>
                    </dl>
                    <ul class="horizontal-list">
                        <li><a href="/persfume">홈 </a></li>
                        <li><a href="list.no">공지사항</a></li>
                        <li><a href="list.ev?condition=onGoing">이벤트</a></li>
                        <li><a href="list.co">향수</a></li>
                        <li><a href="list.oc">원데이 클래스</a></li>
                        <li><a href="#">향 추천</a></li>
                    </ul>
                </div>
                <div>
                    <ul class="xans-element- xans-layout xans-layout-footer company">
                        <li>
                            <span>브랜드명</span> 퍼스퓸
                        </li>
                        <li>
                            <span>고객센터</span> 1544-9970
                        </li>
                        <li>
                            <span>주소</span> 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F
                        </li>
                        <li class="warning">※ 퍼스퓸에서 제공하는 모든 컨텐츠는 저작권법에 보호받는 저작물로서, 무단으로 복제, 배포하는 경우에는 저작권법에 의하여 처벌을 받을 수 있습니다.</li>
                        <li class="copy">Copyright © 퍼스퓸. All rights reserved.</li>
                    </ul>
                </div>
            </figure>
            <figure class="right"></figure>
        </article>
    </section>
</footer>
</body>

</html>