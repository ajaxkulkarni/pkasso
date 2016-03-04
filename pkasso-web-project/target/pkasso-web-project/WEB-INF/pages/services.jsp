<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PKASSO | Services</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <link href="<c:url value="/resources/css/services.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/font-awesome.min.css"/>" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Lora' rel='stylesheet' type='text/css'> 

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
                        
                            <div class="col-md-9 hdiv">
                                 <p id="h1name">PRASHANT KULKARNI & ASSOCIATES</p>        
                            </div>
                            <div class="col-md-9 hdiv">
                                <hr size="0">
                            </div>
                            <div class="col-md-9 hdiv">
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


    <div class="container serv-content" id="div2">
        <div class="row serv">

            <div class="col-md-6">
                <h3><span class="glyphicon glyphicon-chevron-right"></span>
                    Architectural And Interior Design</h3>
                <div class="col-md-4">
                   <img class="img-responsive img1" src="images/archi.png" alt="no image"/>
                </div>
                <div class="col-md-6 serv-list">
                    <li>Data Collection</li>
                    <li>Data Analysis</li>
                    <li>Data Solution</li>
                </div>
            </div>
            
            <div class="col-md-6">
                <h3><span class="glyphicon glyphicon-chevron-right"></span>
                    Liasoning</h3>
                <div class="col-md-4">
                    <img class="img-responsive img1" src="images/liasoning-services.png" alt="no image"/>
                </div>
                <div class="col-md-6 serv-list">
                    <li>Other Concerned</li>
                    <li>Authorities</li>
                    <li>Municipal Agencies</li>
                </div>
            </div>
            
        </div>
        
        <div class="row serv">

            <div class="col-md-6">
                <h3><span class="glyphicon glyphicon-chevron-right"></span>
                    Project Management</h3>
                <div class="col-md-4">
                    <img class="img-responsive img1" src="images/project_management.png" alt="no image"/>
                </div>
                <div class="col-md-6 serv-list">
                    <li>G.A.Drawing</li>
                    <li>Evalution</li>
                    <li>Tender Document</li>
                    <li>Quality supervision</li>
                </div>
            </div>
            
            <div class="col-md-6">
                <h3><span class="glyphicon glyphicon-chevron-right"></span>
                    Multidisciplinary Services</h3>
                <div class="col-md-4">
                    <img class="img-responsive img1" src="images/services.jpg" alt="no image"/>
                </div>
                <div class="col-md-6 serv-list">
                    Co-ordinate with:
                    <li>Structural Design</li>
                    <li>Electrical Design</li>
                    <li>HVAC</li>
                    <li>Plumbing</li>
                    <li>Other Experts</li>
                </div>
            </div>
            
        </div>
    
    
    </div>

<%@include file="footer.jsp" %>
</body>
</html>