<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Persfume Admin - OneClass</title>
<link rel="icon" href="resources/vendor/fontawesome-free/svgs/solid/cogs.svg">
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
    	#sb-btn{
    		display: flex;
    		justify-content: end;
    	}
    	
    	td>div{
    		position : relative;
    		width:100%;
    		height: 400px;
    		border-radius: 10px;
    		border: 3px dashed gray;
    		display: flex;
    		justify-content: center;
    		align-items: center;
    	}
    	
    	td img{
    		position : relative;
    		width: 100%;
    		height: 100%;
    		object-fit: cover;
            background-color: transparent;
    	}
    	
    	.uploadImg>div>.delete-btn{
 	        background-color: transparent;
   			margin : 0;
   			padding : 0;
    		border : none;
    		border-radius : 50%;
    		width: 30px;
    		height: 30px;
    		position : absolute;
    		right: 0;
    		top: 0;
    		z-index: 999;
    	}
    	
    	.uploadImg>div>.delete-btn:hover{
    		background-color:lightgray;
    	}
    	
    	.uploadImg>div{
    		width: 100%;
    		height: 100%;
    	}
    	
	   	.uploadImg>img{
            width: 60px;
            height: 60px;
            background-color: transparent;
            border-radius: 50px;
            border: none;
        }
        
        .uploadImg>img:hover{
        	background-color: lightgray;
        }
        
    </style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <jsp:include page="../common/adminNav.jsp"/>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <jsp:include page="../common/adminTop.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">원데이 클래스 신규 등록</h1>

					<!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-12 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">EnrollForm</h6>
                                </div>
                                <div class="card-body">
	                                <form action="insert.oc" method="post" enctype="multipart/form-data">
	                                	<table class="table">
	                                		<tr>
	                                			<th colspan="2">클래스 명</th>
	                                			<td colspan="4">
	                                				<input type="text" class="form-control form-control-user" name="className" placeholder="클래스명" required>
	                               				</td>
	                               				<th>강사명</th>
	                                			<td>
	                                				<input type="text" class="form-control form-control-user" maxlength="5" name="classTeacher" placeholder="강사명" required>
	                               				</td>
	                               				<th>최대 수강 인원</th>
	                                			<td>
	                                				<input type="text" class="form-control form-control-user" name="studentMaxNo" placeholder="최대 수강 인원" required>
	                               				</td>
	                                		</tr>
	                                		<tr rowspan="3">
	                                			<th colspan="2">클래스 설명</th>
	                                			<td colspan="10">
	                                				<textarea class="form-control" rows="20" name="classDetail" required style="resize: none;"></textarea>
	                               				</td>
	                                		</tr>
	                                		<tr>
	                                			<th colspan="2">가격</th>
	                                			<td>
	                                				<input type="text" class="form-control form-control-user" name="price" placeholder="클래스 가격" required>
	                               				</td>
	                               				<th colspan="2">개강일자</th>
	                                			<td>
	                                				<input type="date" class="form-control form-control-user" name="startDate" required>
	                               				</td>
	                                			<th colspan="1">시작 시간</th>
	                                			<td>
	                                				<input type="time" class="form-control form-control-user" name="startTime" required>
	                               				</td>
	                               				<th colspan="1">종료 시간</th>
	                                			<td>
	                                				<input type="time" class="form-control form-control-user" name="endTime" required>
	                               				</td>
	                                		</tr>
	                                		<tr>
		                                		<th colspan="2">첨부파일(썸네일)</th>
	                                			<td colspan="8">
													<input type="file" accept="image/png, image/jpeg" class="form-control form-control-user" name=upThumbnail placeholder="첨부파일" style="display:none">
	                                				<div class="uploadImg">
							    		                <img src="resources/img/plus-circle.svg" alt="plus-circle" onclick="uploadImg(this);">
	                                				</div>	                               				
                                				</td>
	                                		</tr>
	                                		<tr>
		                                		<th colspan="2">첨부파일</th>
	                                			<td colspan="8">
	                                				<input type="file" accept="image/png, image/jpeg" class="form-control form-control-user" name="upFiles" placeholder="첨부파일" style="display:none">
	                                				<div class="uploadImg">
							    		                <img src="resources/img/plus-circle.svg" alt="plus-circle" onclick="uploadImg(this);">
	                                				</div>
	                               				</td>
	                                		</tr>
	                                	</table>
	                                    
	                                    <hr>
	                                    <div id="sb-btn">
		                                    <button type="submit" class="btn btn-sm btn-primary">Submit</button>
										</div>                                    
                                	</form>
                                </div>
                            </div>

                        </div>
                    </div>	

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
                
			  <script>
			   
			   $(function() {
			   	
				   	/* $(".uploadImg>img").on('click', function(){
				   		const imgInput = $(this).parent().prev();
				   		const imgType = imgInput.attr("name");
				   		imgInput.click();
				   		
				   		imgInput.on('change', function(e) {
				   			getImageFiles(e, imgType);
				   		});
				   			
				   	}); */
				   	
				   	
				});
			   
			   function uploadImg(element){
				   const imgInput = $(element).parent().prev();
			   		const imgType = imgInput.attr("name");
			   		
			   		console.log(imgInput);
			   		
			   		imgInput.click();
			   		
			   		imgInput.on('change', function(e) {
			   			getImageFiles(e, imgType);
				   		console.log(imgInput.val());

			   		});
			   		
			   }
			   
			   
			   function createElement(e, file) {
			      const wrap = document.createElement('div');
			      const div = document.createElement('div');
			      const img = document.createElement('img');
			      const deleteBtn = document.createElement('div');
			      const btnImage = document.createElement('img');
			      
			      
			      btnImage.setAttribute('src', 'resources/img/x-circle.svg');
			      btnImage.setAttribute('onClick','deleteImg(this);');
			      deleteBtn.className = 'delete-btn';
			      btnImage.className = 'delete-btn';
			      img.setAttribute('src', e.target.result);
			      img.setAttribute('data-file', file.name);
			      deleteBtn.appendChild(btnImage);
			      div.appendChild(img);
			      div.appendChild(deleteBtn);
			      wrap.appendChild(div);
			      return wrap;
			    }
			   
			   
			   function getImageFiles(e, imgType) {
				   
				   if(e.currentTarget.files.length == 1) {
				   
	  			      const file = e.currentTarget.files[0];
				      var imagePreview;

				      
				      if(imgType == 'upThumbnail'){
				    	  imagePreview = $('input[name="upThumbnail"]').next();
				      } else{
				    	  imagePreview = $('input[name="upFiles"]').next();
				      }
				      
				      console.log(imagePreview.attr('class'));
				      
				      var reader = new FileReader(); 
				      reader.onload = function(e) {
				    	  var div = createElement(e, file);
				    	  imagePreview.html(div.innerHTML);
				      }

				      reader.readAsDataURL(file);
				   }
		      }
			   
			   
			  function deleteImg(element){
				  	let delElement = $(element).parents('.uploadImg');
				  	const imgType = delElement.prev().attr("name");
				  	
				  	
				  	delElement.html('<img src="resources/img/plus-circle.svg" alt="plus-circle" onclick="uploadImg(this);">');
				  	delElement.prev().remove();
				  	
				  	
				  	if(imgType == 'upThumbnail'){
					  	delElement.before('<input type="file" accept="image/png, image/jpeg" class="form-control form-control-user" name=upThumbnail placeholder="첨부파일" style="display:none">');
	
				  	} else{
				  		
					  	delElement.before('<input type="file" accept="image/png, image/jpeg" class="form-control form-control-user" name="upFiles" placeholder="첨부파일" style="display:none">');

				  	}
				  
				  	
			  }
			   
			  
			   
		   	
			   </script>

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; DongNet Since 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>



</body>

</html>