<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PKASSO | Home</title>
</head>
<body>
<%@include file="header.jsp" %>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" id="div2">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>

              <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                            <div class="item active">
                                    <img src="<c:url value="/resources/images/slide_show_05.jpg"/>" alt="slide1">
                            </div>
                            <div class="item">
                                    <img src="<c:url value="/resources/images/slide_show_05.jpg"/>" alt="slide2">
                            </div>
                            <div class="item">
                                    <img src="<c:url value="/resources/images/slide_show_05.jpg"/>" alt="slide3">
                                    <div class="carousel-caption">
                                
                                    </div>
                            </div>
                    </div>

              <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div> <!-- Carousel -->
<%@include file="footer.jsp" %>
</body>
</html>