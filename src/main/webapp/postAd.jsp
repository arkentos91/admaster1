<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>  Ads in Sri Lanka.</title>
        <link rel="shortcut icon" href="/favicon.ico">
        <meta name="keywords" content="Massage, Massage classifieds, Massage ads,  lanka ads, advertisement, ads, lanka, sri lanka, classifieds, advertisements, ikman, lanka classifieds, free classified ads, service, buy, sell ">
        <meta name="description" content="Massage, Massage classifieds, Massage ads,  Sri Lankan best classified ad site. Post your ads without any restrictions. ">
        <meta name="ROBOTS" content="all">
 
        <link href="${pageContext.request.contextPath}/style.css?10.1" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/font-awesome-4.6.3/css/font-awesome.min.css"/>
        <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" />
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <script>
             
        </script>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mart"  user = "root"  password = "password"/>

        <sql:query dataSource = "${snapshot}" var = "ad_count_result">
            select *  from category ;
        </sql:query>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}">Brand Goes Here</a>

                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <form class="navbar-form navbar-right" action="searchServlet" method="post">
                        <div class="form-group">
                            <input type="text" placeholder="search ads" class="form-control" name="search" >
                            <button type="submit" class="btn btn-info">Search</button>
                            <span></span>
                        </div>
                    </form>

                </div>
            </div>
        </nav> 

        <div class="jumbotron">
            <div class="container">
                <div class="col-md-2">
                    <a href="/"><img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Lanka Ads Logo" class="logo"></a>
                </div>

            </div>
        </div> 
        <div class="container">
            <div class="row content">
                <div class="col-md-2 sidenav">
                    <div class="list-group">

                    </div>
                </div>        
                <div class="col-md-6 rounded-div">    
                    <form class="navbar-form navbar-left" action="postAdServlet" method="post" id="addpost"  enctype="multipart/form-data" >
                        <div class="form-group" id="addpost">
                            <label>Category</label>&nbsp;&nbsp;&nbsp;<select name='role' class="form-control" >
                                <c:forEach var = "row" items = "${ad_count_result.rows}">
                                    <option value="${row.category_name}" >${row.category_name}</option> 
                                </c:forEach>
                            </select>  <br> <br>
                            
                            <label>Subject</label>&nbsp;&nbsp;&nbsp;<input type="text" placeholder="Subject" class="form-control" name="subject" size="50px"><br> <br>
                            <label>Content</label>&nbsp;&nbsp;&nbsp;<textarea name="content" rows="4" cols="50" form="addpost" class="form-control" placeholder="Content" ></textarea> <br> <br>
                            <label>Add photo </label><input type = "file" class="form-control"  name = "file" size = "50" />
                            <button type="submit" class="btn btn-info">Post Now</button>
                            <sql:update dataSource = "${snapshot}" var = "result">
                                update advertisement set status='ACT' where status='ACT';
                            </sql:update>
                        </div>
                    </form>  
                </div>    
            </div>
        </div>
    </body>
</html>
