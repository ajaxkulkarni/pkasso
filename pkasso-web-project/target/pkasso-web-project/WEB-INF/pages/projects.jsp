<%@page import="com.pkasso.web.bo.domain.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PKASSO</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    
    <link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/font-awesome.css"/>" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif' rel='stylesheet' type='text/css'>
    <link href="<c:url value="/resources/css/projects1.css"/>" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:500,700,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <%-- <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.2.min.js"/>"></script> --%>
     <script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
     <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var controlCount = 0;
		 $("#addFiles").click(function() {
			 	controlCount++;
			 	if(controlCount > 4) {
			 		alert("Enough controls already!");
			 		return;
			 	}
			 	
		    	var container = $(document.createElement('div'));
				$(container).append('<input type=file name=files['+ controlCount +']/>');
				$("#extraFiles").after(container);
		})
	});
	
	function setCategory(categoryName) {
		$("#inputCategory").val(categoryName);
		$("#projectCategory").html(categoryName);
	}
    function onPreview(projectId) {
         $.ajax({
        	type : "POST",
            url : 'preview',
            dataType: 'json',
            data: "projectId=" + projectId,
            success : function(data) {
                //$('#result').html(data);
                $('#projectName').html(data.name);
                $('#clientName').html(data.clientName);
                $('#projectDescription').html(data.description);
                $("#projectImage").attr("src","files/" + data.slides[0].id);
                $("#projectCategory").html(data.categoryName);
                $("#projectId").attr("value",data.id);
                //alert(data.id)
                var appendString = "";
                $.each(data.slides,function(i,slide){
                	//alert(slide);
                	if(i == 0) {
                		//$("#slide1").attr("src","files/" + slide);
                		appendString = "<div class=\"item active\"><img src=\"files/" + slide.id +"\" alt=\"slide2\"></div>";
                	}
                	else {
                	appendString = appendString + "<div class=\"item\"><img src=\"files/" + slide.id +"\" alt=\"slide2\"></div>";
                	}
                });
                //alert(appendString);
                $("#slider").html(appendString);
                
            },
            error: function(e){
            	alert('Error: ' + e);
        	}
        });
    }
    
</script>
    
    
</head>
<body onload="loadXMLDoc1()">

	<%@include file="header.jsp" %>
    <!-- Div trigger modal -->
    <div class="projects_div" id="projects_div">
    	<c:forEach items="${categories}" var="category">
        <div class="project_sub_div">
                <label class="project_label">${category.name}</label><br/>
                <c:forEach var="project" items="${category.projects}">
                	<img src="files/${project.slides[0].id}"  alt="resi1" data-toggle="modal" data-target="#myModal1" onclick="onPreview(${project.id})" class="project_img"/>
                </c:forEach>
                <c:if test="${loggedIn}">
                	<input type="button" class="project_label2" value="Add New" data-toggle="modal" data-target="#editModal" onclick="setCategory('${category.name}')">
    			</c:if>
        </div>
        </c:forEach>
    </div>
    
    <!-- End OF Div trigger modal -->


       <!-- Modal -->
            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 id="projectCategory" class="modal-title" style="color:black;" id="myModalLabel">Residensitial</h4>
                  </div>
                  <c:if test="${loggedIn}">
                  <form action="delete" method="post">
                		<input type="hidden" id= "projectId" name="projectId" />
                		<input type="submit" value="Delete"/> 
                	</form>
                	</c:if>
                  <div class="modal-body">
					 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" id="div2">
					<!-- Indicators -->
              		<ol class="carousel-indicators">
                		<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
                		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
              		</ol>
					
              		<!-- Wrapper for slides -->
                    <div id="slider" class="carousel-inner">
                    	<!-- Slides will be loaded dynamically here -->
                   	</div>

              		<!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
 					<!-- <img  id="projectImage" src="images/projects/project1.jpg"  alt="resi1" class="img_display"/> -->
                      <label id="projectName" class="project_label2">Project Name</label><br/>
                      <label id="clientName" class="project_label2">Client Name</label><br/>
                      <label id="projectDescription" class="project_label2">Description</label>
                  </div>
                </div>
              </div>
            </div>

        <!--  End OF Modal -->
        
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 id="projectCategory" class="project_label2" id="myModalLabel">Add New Project</h4>
                  </div>
                  <div class="modal-body">
                  <form action="addProject" method="post" enctype="multipart/form-data">
                  	<table>
                  		<tr>
                  		 	<td><label id="projectName" class="project_label2">Project Name</label></td>
                      		<td><input type="text" class="project_label2" name="name" required="required"/></td>
                  		</tr>
                  		<tr>
                  		 	<td><label id="clientName" class="project_label2">Client Name</label></td>
                      		<td><input type="text" class="project_label2" name="clientName" required="required"/></td>
                  		</tr>
                     	<tr>
                     		<td><label id="projectDescription" class="project_label2">Description</label></td>
                     		<td><textarea rows="4" cols="50" class="project_label2" name="description"></textarea></td>
                     		<td><input type="hidden" id="inputCategory" name="categoryName"/></td>
                     	</tr>
                      	<tr>
                      		<td>Slide show Images:</td>
                      		<td><input type="file" class="project_label2" name="files[0]" required="required"/>
                      		<div id="extraFiles">
                      		</div></td>
                      		<td><input  id="addFiles" type="button" onclick="addFileControl()" class="project_label2" value="Add more Files.."/></td>
                      	</tr>
                      	<tr><td><input type="submit" class="project_label2" value="Save"/></td></tr>
                      </table>
                   </form>
                  </div>
                </div>
              </div>
            </div>
        
    <%@include file="footer.jsp" %>
	<!-- jQuery -->
    <script src="<c:url value="/resources/js/jquery.js"/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 1700 //changes the speed
    })
    </script>
</body>

</html>
    