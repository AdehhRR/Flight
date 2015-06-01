<%-- 
    Document   : bookingmanager
    Created on : 19-May-2015, 17:09:05
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>

<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
            <ul class="nav navbar-nav navbar-right">
                <li><a class="navbar-brand" href="#" onclick="bmusecase(0)"><span class="glyphicon glyphicon-home"> HOME</span></a> </li>
                <li><a href="#menu-toggle" class="btn btn-info" id="menu-toggle"><span class="glyphicon glyphicon-pushpin"></span></a></li>
            </ul>                      
        </div>             
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">             
            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div id="wrapper" class="">
        
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav ">
                <br>
                
                <li  data-toggle="collapse" data-target="#profiles" class="collapsed active">
                  <a href="#">Profiles<span class="glyphicon glyphicon-menu-right"></span></a>
                </li>
                <ul class="collapse" id="profiles">
                    <li id="m1">
                        <a href="#" onclick="bmusecase(1)">Re-arrange Time</a>
                    </li>       
                </ul>                
            </ul>
        </div>
        
        <div id="page-content-wrapper" id="home">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-header">
                           <h1>Hello Booking manager <%
                               HttpSession hs=request.getSession(true);  
                               String user = (String)hs.getAttribute("username");                         
                               out.print(user);
                           %>, What would you like to do?</h1>
                        </div>                                           
                    </div>
                </div>
            </div>
        </div>
                        
        <div class="col-xs-12 col4">
            <div id="sec0" >            
                    <img src="images/bookingm.jpg" class="img-responsive" >
            </div>
            <div id="sec1">
                
            </div>
        </div>                
       
        
    </div>
</div>
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>
<jsp:include page="footer.jsp"/>
