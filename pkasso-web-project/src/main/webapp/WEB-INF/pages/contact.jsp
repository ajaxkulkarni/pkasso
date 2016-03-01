<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PKASSO | Contact</title>
</head>
<body>
<%@include file="header.jsp" %>
</div>
    
    
         <div class="container row">
             <form action="" method="post">
                 
            <div class="forum col-md-6">
                
               <div class="form-group col-md-12">
                    <div class="col-md-12">
                     <label for="description">Discussion forum for Enquiry / Feedback / Suggestions / Topic :</label>
                   </div>
                    <div class="col-md-8">
                    <textarea class="form-control" rows="5" id="description" name="description"></textarea>
                   </div>
               </div>
    
            <div class="form-group col-md-12">
                   <div class="col-md-2">
                   <label for="name"> Name :</label>
                   </div>
                   <div class="col-md-6">
                   <input type="text" autocomplete="name" class="form-control" name="name" id="name" required>
                   </div>
              </div>

               
               <div class="form-group col-md-12">
                   <div class="col-md-2">
                   <label for="email"> Email :</label>
                   </div>
                   <div class="col-md-6">
                   <input type="email" autocomplete="email" class="form-control" name="email" id="email" required>
                   </div>
               </div>
               <div class="form-group col-md-12">
                   <div class="col-md-2">
                   </div>
                    <div class="col-md-10 col-xs-10">
                     <input type="reset" class="button" name="reset" value="Clear">
                      <input type="submit" class="button" name="submit" value="Submit">
                   </div>
               </div>
                 
                </div>
             </form>
    
           </div>
    
    <div class="container address_div">
        <label>Contact US</label>
        <p>Prashant Kulkarni & Associates,<br/>
        2/18, purushotam Appt.,<br/>
        Sheela Vihar Colony,<br/>
        Paud Phata, Erandwane ,<br/>
        Pune - 411038.<br/>
            
            <label>Contact No: 020 - 25435847</label><br/>
            <label>Email: "pkasso.adm@gmail.com</label>
        </p>
    </div>


<%@include file="footer.jsp" %>
</body>
</html>