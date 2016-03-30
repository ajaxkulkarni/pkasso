<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PKASSO | Contact Us</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <link href="<c:url value="/resources/css/contact.css"/>" rel="stylesheet">
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





    
    <br/>
         <div class="container row">
             <form action="" method="post">
                 
            <div class="forum col-md-12">
                
               <div class="form-group col-md-12">
                    <div class="col-md-12">
                     <label for="description">Discussion forum for Enquiry / Feedback / Suggestions / Topic :</label>
                   </div>
                    <div class="col-md-4">
                    <textarea class="form-control" rows="5" id="description" name="description"></textarea>
                   </div>
               </div>
    
            <div class="form-group col-md-12">
                   <div class="col-md-12">
                   <label for="name"> Name :</label>
                   </div>
                   <div class="col-md-4">
                   <input type="text" autocomplete="name" class="form-control" name="name" id="name" required>
                   </div>
              </div>

               
               <div class="form-group col-md-12">
                   <div class="col-md-12">
                   <label for="email"> Email :</label>
                   </div>
                   <div class="col-md-4">
                   <input type="email" autocomplete="email" class="form-control" name="email" id="email" required>
                   </div>
               </div>
               <div class="form-group col-md-12">
                   <div class="col-md-12">
                   </div>
                    <div class="col-md-10 col-xs-10">
                     <input type="reset" class="button" name="reset" value="Clear">
                      <input type="submit" class="button" name="submit" value="Submit">
                   </div>
               </div>
                 
                </div>
             </form>
    
           </div>
    
     <div class="col-md-12">
    <div class="container address_div1">
        <label>Contact US</label>
        <p>Prashant Kulkarni & Associates,<br/>
        2/18, purushotam Appt.,<br/>
        Sheela Vihar Colony,<br/>
        Paud Phata, Erandwane ,<br/>
        Pune - 411038.<br/>
            
            Contact No: 020 - 25435847<br/>
           Email: "pkasso.adm@gmail.com
        </p>
    </div>
</div>
      <footer class="container-fluid" id="div3">
            <div class="row">
                <div class="col-md-7 col-xs-12" id="con1">
                    <p>COPYRIGHT &copy; PRASHANT KULKARNI AND ASSOCIATES</p>
                </div>
                    
                <div class="col-md-4 col-xs-12 pull-left" id="social_icon">
    
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