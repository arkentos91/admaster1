<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>  Massage ads in Sri Lanka.</title>
        <link rel="shortcut icon" href="/favicon.ico">
        <meta name="keywords" content="Massage, Massage classifieds, Massage ads,  lanka ads, advertisement, ads, lanka, sri lanka, classifieds, advertisements, ikman, lanka classifieds, free classified ads, service, buy, sell ">
        <meta name="description" content="Massage, Massage classifieds, Massage ads,  Sri Lankan best classified ad site. Post your ads without any restrictions.  ">
        <meta name="ROBOTS" content="all">
        <link href="${pageContext.request.contextPath}/style.css?10.1" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" />
         
    </head>

    <body>
        <style>
            body {
                font-family: "Lato", sans-serif;
            }
            .navbar {
                overflow: hidden;
                background-color: #4B0082;
                position: 200px ;
                top: 0;
                width: 100%;
              }

              .navbar a {
                float: left;
                display: block;
                color: #ffffff;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
              }

              .navbar a:hover {
                background: #ddd;
                color: black;
              }
            .sidenav {
                height: 100%;
                width: 200px;
                position: fixed;
                z-index: 1;
                top: 150px;
                left: 0;
                background-color: #4B0082;
                overflow-x: hidden;
                padding-top: 200px;
            }

            .sidenav a {
                padding: 6px 6px 6px 32px;
                text-decoration: none;
                font-size: 15px;
                color: #ffffff;
                display: block;
            }

            .sidenav a:hover {
                color: #f1f1f1;
            }
            
            .rightnav{
                height: 100%;
                width: 200px;
                position: fixed;
                z-index: 1;
                top: 150px;
                right: 0;
                background-color: #4B0082;
                overflow-x: hidden;
                padding-top: 200px;
            }

            .rightnav a {
                padding: 6px 6px 6px 32px;
                text-decoration: none;
                font-size: 15px;
                color: #ffffff;
                display: block;
            }

            .rightnav a:hover {
                color: #f1f1f1;
            }rightnav

            .main {
                margin-left: 200px; /* Same as the width of the sidenav */
            }

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
            }
            
            div.colomn {
                position: relative;
                left: 10%;
                border: 2px #4B0082;
            }
            
            table {
                width:50%;
                right: 50px;
            }
            tr{
                left: 50px;
            }/*
            table, th, td {
                border: 2px solid black;
                border-collapse: collapse;
            }
            
            th, td {
                padding: 15px;
                text-align: left; 
                width: 300px;
            }
            table#t01 tr:nth-child(even) {
                background-color: #eee;
            }
            table#t01 tr:nth-child(odd) {
                background-color: #fff;
            }
            table#t01 th {
                background-color: black;
                color: white;
            }*/
        </style>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mart"  user = "root"  password = "password"/>

        <sql:query dataSource = "${snapshot}" var = "result">
            select * from advertisement;
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
                    <a class="navbar-brand" href="/">Lanka Ads</a>
                    &nbsp;&nbsp;
                    <span class="top-fb">
                        <a class="btn btn-sm btn-info" href="/postAd.php">Post Your Ad</a>
                    </span>
                </div>
            </div>
            </nav>
        <div class="colomn">
           <table   border = "1"   >
                
                <c:forEach var = "row" items = "${result.rows}">
                    <tr href="${row.id}" >
                        <td class="">
                            <h3><c:out value = "${row.ad_subject}"/></h3><br>
                            <c:out value = "${row.ad_content}" />
                             
                        </td> 
                        
                    </tr>
                </c:forEach>
            </table>
            
        </div>
          
         


    </body>
</html>