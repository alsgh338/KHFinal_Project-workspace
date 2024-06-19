<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
     .content-area,
        .content-area>div:not(.content-main){
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }

        /* 여기서부턴 공통 스타일? (아마도) */

        .content-title{
            height: 320px;
           background: url(resources/images/공지사항.jpg);
            background-size: cover;
            background-position: center;
            object-fit: cover;
            text-align: center;
            line-height: 320px;
            font-size: 50px;
            text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px black;
            color: white;
            width: 100%;
        }

        .content-subtitle,
        .content-main
        {
            width: 1400px;
        }
        

        .content-subtitle{
            line-height: 150px;
            font-size: 30px;
            font-weight: 600;
        }

        .content-main{
            display: inline-block;
            text-align: center;
        }
        /* 여기에 CSS 스타일을 복사하여 붙여넣으세요 */
        
        .bbs-tit {
            margin-top: 60px;
        }

        .bbs-tit h3 {
            text-align: center;
            font-size: 16px;
            color: #000000;
            font-weight: bold;
            line-height: 30px;
        }

        /* 단순화된 CSS 스타일 */
        html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
            margin: 0;
            padding: 0;
        }

        * {
            -webkit-font-smoothing: antialiased;
            -webkit-text-size-adjust: none;
        }

        div {
            display: block;
            unicode-bidi: isolate;
        }

        body, h1, h2, h3, h4, h5, h6, table, select, textarea, a, p {
            font-family: 'Pretendard', "Noto Sans KR", "Roboto", Dotum, AppleGothic, Helvetica, sans-serif;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            table-layout: fixed;
            word-wrap: break-word;
            word-break: keep-all;
        }

        /* 제목과 파일 스타일 */
        .bbs-table-write .input_style2 {
            width: 700px;
        }

        .bbs-table-write tbody th {
            padding-left: 30px;
            font-size: 14px;
            font-weight: normal;
            background: #f8f8f8;
            text-align: center; /* 가운데 정렬 추가 */
        }

        .bbs-table-write tbody th div {
            text-align: center; /* div 요소의 가운데 정렬 추가 */
        }

        /* textarea 스타일 */
        textarea {
            color: #1c1c1c;
            line-height: 1.25;
            word-wrap: break-word;
            word-break: keep-all;
            border-spacing: 0;
            border-collapse: collapse;
            font-family: 'Pretendard', "Noto Sans KR", "Roboto", Dotum, AppleGothic, Helvetica, sans-serif;
            font-size: 14px;
            -webkit-font-smoothing: antialiased;
            -webkit-text-size-adjust: none;
            width: 700px;
            height: 328px !important; /* 높이 강제 적용 */
            padding: 2px;
            border: 1px solid #EDEDED;
            resize: none;
        }
 .bbs-table-write {
        margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
        width: 800px; /* 테이블의 최대 너비 설정 */
    }
        .bbs-table-write tbody th, .bbs-table-write tbody td {
            padding: 13px 0;
            text-align: left;
            border-bottom: 1px solid #e9e9e9;
        }
        
        .bbs-table-write .MS_input_txt {
            
            height: 38px;
            line-height: 31px;
            border: 1px solid #ddd;
            background: #fff;
        }

        .bbs-table-write tbody td {
            padding: 13px 10px;
        }

        .bbs-table-write .btn_file {
            display: inline-block;
            margin-left: -1px;
            padding: 0 5px;
            height: 31px;
            font-size: 11px;
            line-height: 31px;
            border: 1px solid #e4e4e5;
            background: #f5f5f5;
            text-decoration: none; /* 밑줄 제거 */
        }

        /* 버튼 */
        #bbsData .bbs-link-btm {
            margin-top: 40px;
            text-align: center;
        }
        #bbsData .bbs-link-btm a {
            width: 228px;
            height: 58px;
            font-size: 16px;
            line-height: 58px;
            text-decoration: none; /* 밑줄 제거 */
        }

        .CSSbuttonBlack {
            display: inline-block;
            color: #fff;
            text-align: center;
            border: 1px solid #231f20;
            background: #231f20;
            transition: all 0.3s ease;
            text-decoration: none; /* 밑줄 제거 */
        }

        .CSSbuttonWhite {
            display: inline-block;
            color: #1d1b1b;
            text-align: center;
            border: 1px solid #dbdbdb;
            background: #fff;
            transition: all 0.3s ease;
            text-decoration: none; /* 밑줄 제거 */
        }

        body, h1, h2, h3, h4, h5, h6, table, pre, xmp, plaintext, listing, input, textarea, select, button, a {
            font-size: 13px;
            color: #1c1c1c;
            line-height: 1.25;
            font-family: 'Pretendard', 'Poppins', 'Noto Sans KR', sans-serif, Dotum, "돋움", DotumChe, "돋움체", Verdana, monospace, Corbel, AppleGothic, Helvetica;
        }
          
          
      
        
    </style>
</head>
<body>

  <div class="content-area">
        <div class="content-title" id="home">NOTICE</div>
    <div id="contentWrapper">
        <div id="contentWrap">
            <link type="text/css" rel="stylesheet" href="/template_common/shop/basic_simple/menu.1.css?t=201711221039">
            <div id="content">
                <div id="bbsData">
                    <div class="page-body">
                        <div class="bbs-tit">
                            <h3>공지글 수정하기</h3>
                        </div>
                        
                        
                        <div class="bbs-table-write">
                            <form name="adUpdateForm" action="adUpdate.no" method="post" enctype="multipart/form-data" style="position:relative;" autocomplete="off">
                                   <!-- 해당 게시글의 글번호 (PK) 도 같이 넘기기 -->
                					<input type="hidden" name="noticeNo" value="${ requestScope.n.noticeNo }">
                
                                <div id="passimg" style="position:absolute; visibility:hidden; z-index:999;"></div>
                                <table align="center">
                                    <colgroup>
                                        <col width="135">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><div>제목</div></th>
                                            <td colspan="3">
                                                <div class="title">
                                                    <input id="bw_input_subject" class="MS_input_txt input_style2" value="${requestScope.n.noticeTitle }" type="text" name="noticeTitle" required>
                                                    <div class="title_select"></div>
                                                </div>
                                            </td>
                                        </tr>
                                      <tr>
							    <th><div>내용</div></th>
							    <td colspan="3" class="text_content">
							        <div>
							            <textarea id="MS_text_content" name="noticeContent" wrap="off" onfocus="clear_content()" class="MS_input_txt" style="font-family:굴림체;"
							            style="resize:none;" required>${requestScope.n.noticeContent}</textarea>
							        </div>
							    </td>
							</tr>
						
						<tr>
						    <th><div>파일</div></th>
						    <td colspan="4">
						        <div>
						            <input type="file" id="bw_input_file" class="MS_input_txt input_style2" name="reupfile">
						       </div>     
							<c:if test="${not empty requestScope.n.noticeImgOrigin}">
						    현재 업로드된 파일 :
						    <a href="${requestScope.n.noticeImgChange}" 
						    	download="${requestScope.n.noticeImgOrigin}">
						        ${requestScope.n.noticeImgOrigin}
						    </a>

				    <input type="hidden" 
				    		name="noticeImgOrigin" 
				    		value="${requestScope.n.noticeImgOrigin}">
				    <input type="hidden" 
				    		name="noticeImgChange" 
				    		value="${requestScope.n.noticeImgChange}">
					</c:if>
   
    </td>
</tr>
        </table>                                   
</div>
                                               
                                
                            
                              
                       <dl class="bbs-link bbs-link-btm">
					    <dt></dt>
					    <dd>
<a href="javascript:void(0);" class="CSSbuttonBlack" onclick="submitForm();">수정하기</a>
<a onclick="javascript:history.go(-1);" class="CSSbuttonWhite">뒤로가기</a>

					    </dd>
					</dl>
					  </form>
					  <script>
function submitForm() {
    var title = document.getElementById('bw_input_subject').value.trim();
    var content = document.getElementById('MS_text_content').value.trim();

    if (title === '') {
        alert('제목을 입력해주세요.');
        return;
    }

    if (content === '') {
        alert('내용을 입력해주세요.');
        return;
    }

    // 추가적인 유효성 검사를 원한다면 여기에 추가

    document.adUpdateForm.submit(); // 폼 제출
}
</script>
					  
				
	

                                  <br><br>
                          
                        </div>
                    </div><!-- .page-body -->
                </div><!-- #bbsData -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div><!-- #contentWrapper -->
    
   
</body>

</html>
