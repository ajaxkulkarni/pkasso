<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PKASSO | Credentials</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <link href="<c:url value="/resources/css/credentials.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/font-awesome.min.css"/>" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Lora' rel='stylesheet' type='text/css'> 
     
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Navigation -->
        <div role="navigation" class="navbar navbar-default navbar-static-top" id="div1">
            <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-1">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header" >

                            <a class="navbar-brand" href="/pkasso-web-project/" >
                                <img src="<c:url value="/resources/images/logo4.png"/>"  alt="pkasso" class="logo">
                            </a>
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            </button>  
                        </div>
                        </div>
        
            <div class="col-md-11">
                <div class="baner1">
                     
                </div>
                        
                            <div class="col-md-10 hdiv">
                                 <p id="h1name">PRASHANT KULKARNI & ASSOCIATES</p>        
                            </div>
                            <div class="col-md-10 hdiv">
                                <hr size="0">
                            </div>
                            <div class="col-md-10 hdiv">
                                <p id="h2name">SHAPING EXCELLENCE SINCE 1992</p>
                            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
                <div id="services_menu">
                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                    <ul class="nav  navbar-nav">
                            <li> <a href="home.htm">Home</a></li>
                            <li> <a href="vision.htm">vision / Mission</a></li>
                            <li><a href="services.htm">Services</a></li>
                            <li> <a href="projects.htm">Projects</a></li>
                            <li><a href="credentials.htm">Credentials</a></li>
                            <li><a href="contact.htm">Contact Us </a></li>
                            <c:if test="${loggedIn}">
                            <li><a href="logout.htm">LOGOUT</a></li>
                            </c:if>
                    </ul>
            
                </div>
                </div>
            <!-- /.navbar-collapse -->
      
        </div>
     </div>
    </div>


 <div class="projects_div" id="projects_div">
 
        <div class="container credential_div">
        <div class="col-md-11">
            <h3><span class="glyphicon glyphicon-chevron-right"></span>
                    Awards and Appreciation</h3>
            <p>PKASSO has successfully designed and got executed projects of various nature, scale for our esteemed clients and for their
                complete satisfaction.</p>
            <c:if test="${loggedIn}">
            	<input type="button" class="project_label2" value="Add New" data-toggle="modal" data-target="#editModal">
    		</c:if>
    		<c:forEach items="${projects}" var="project" >
            <div class="credential_row">
                <img src="files/${project.slides[0].id}"  alt="resi1" data-toggle="modal" data-target="#${project.id}"  class="certificate_img"/>
            </div>
            </c:forEach>
            
          <c:forEach var="project" items="${projects}">	 	
            <div class="modal fade" id="${project.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 id="projectCategory" class="modal-title" style="color:black;" id="myModalLabel">${project.categoryName}</h4>
                  </div>
                  <c:if test="${loggedIn}">
                  	<form action="delete" method="post">
                		<input type="hidden" id= "projectId" name="projectId" value="${project.id}" />
                		<input type="submit" value="Delete"/> 
                	</form>
                </c:if>
                  <div class="modal-body">
					
              		<!-- Wrapper for slides -->
                    <div id="slider" class="carousel-inner">
                    <c:set var="first" value="true"></c:set>
                    <!-- Slides will be loaded dynamically here -->
                    <c:forEach var="slide" items="${project.slides}" >
                    	<div class="item active">
                			<img src="files/${slide.id}"  alt="resi1"/>
                		</div>
                	</c:forEach>
                   	</div>

                	</div>
 					<!-- <img  id="projectImage" src="images/projects/project1.jpg"  alt="resi1" class="img_display"/> -->
                      <label id="projectName" class="project_label2">${project.name}</label><br/>
                      <label id="projectDescription" class="project_label2">${project.description}</label>
                  </div>
                </div>
              </div>
		</c:forEach>
    
        </div>
        
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 id="projectCategory" class="project_label2" id="myModalLabel">Add New Credential</h4>
                  </div>
                  <div class="modal-body">
                  <form action="addProject" method="post" enctype="multipart/form-data">
                  	<table>
                  		<tr>
                  		 	<td><label id="projectName" class="project_label2">Title</label></td>
                      		<td><input type="text" class="project_label2" name="name" required="required"/></td>
                  		</tr>
                     	<tr>
                     		<td><label id="projectDescription" class="project_label2">Description</label></td>
                     		<td><textarea rows="4" cols="50" class="project_label2" name="description"></textarea></td>
                     		<td><input type="hidden" id="inputCategory" name="categoryName"/></td>
                     	</tr>
                      	<tr>
                      		<td>Image :</td>
                      		<td><input type="file" class="project_label2" name="files[0]" required="required"/>
                      		</td>
                      	</tr>
                      	<tr><td><input type="submit" class="project_label2" value="Save"/></td></tr>
                      </table>
                   </form>
                  </div>
                </div>
              </div>
            </div>
             </div>
             </div>
              <footer class="container-fluid" id="div3">
            <div class="row">
                <div class="col-md-7 col-xs-12" id="con1">
                <div class="footer">
                    <p>COPYRIGHT &copy; PRASHANT KULKARNI AND ASSOCIATES</p>
                </div>
                </div>
                    
                <div class="col-md-4 col-xs-12 pull-right" id="social_icon">
    
                    <ul>
                        <div class="col-md-4 col-xs-12" id="con">
                        <li></li></div>
                        <div class="col-md-2 col-xs-4">
                            <li><a href="http://linkedin.com/"><i class="fa fa-linkedin-square fa-2x"></i></a></li></div>
                        <div class="col-md-2 col-xs-4">
                            <li><a href="http://twitter.com/"><i class="fa fa-twitter-square fa-2x"></i></a></li></div>
                        <div class="col-md-2 col-xs-4">
                            <li><a href="http://facebook.com/"><i class="fa fa-facebook-square fa-2x"></i></a></li></div>
                    </ul>
                     
                </div>
            </div>
            <!-- /.row -->
        </footer>

</body>
</html>