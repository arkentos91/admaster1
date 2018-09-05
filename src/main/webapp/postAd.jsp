<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

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
        <!--<link rel="stylesheet" href="/bootstrap.min.css">-->
        <!--<link rel="stylesheet" href="/font-awesome-4.6.3/css/font-awesome.min.css">-->
        <!--<link rel="stylesheet" href="/style.css?10.1">-->
        <link href="${pageContext.request.contextPath}/style.css?10.1" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/font-awesome-4.6.3/css/font-awesome.min.css"/>
        <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" />
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({
                google_ad_client: "ca-pub-3554298857405272",
                enable_page_level_ads: true
            });
        </script>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mart"  user = "root"  password = "password"/>
            
                
     
     <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">Brand Goes Here</a>
                   
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <form class="navbar-form navbar-right" action="/search.php" method="get">
                        <div class="form-group">
                            <input type="text" placeholder="search ads" class="form-control" name="q">
                            <button type="submit" class="btn btn-info">Search</button>
                            <span></span>
                        </div>
                    </form>
                    <div class="list-group-top">
                        <a href='/Automobiles/' title="Automobiles ads" class="list-group-item">  Automobiles (3)</a>
                        <a href='/Business/' title="Business ads" class="list-group-item"><i class="fa fa-fw fa-Business" aria-hidden="true"></i> Business (59)</a>
                        <a href='/Electronics/' title="Electronics ads" class="list-group-item"><i class="fa fa-fw fa-Electronics" aria-hidden="true"></i> Electronics (1)</a>
                        <a href='/Employment/' title="Employment ads" class="list-group-item"><i class="fa fa-fw fa-Employment" aria-hidden="true"></i> Employment (31)</a>
                        <a href='/General/' title="General ads" class="list-group-item"><i class="fa fa-fw fa-General" aria-hidden="true"></i> General (31)</a>
                        <a href='/Mobile/' title="Mobile ads" class="list-group-item"><i class="fa fa-fw fa-Mobile" aria-hidden="true"></i> Mobile (4)</a>
                        <a href='/Computer/' title="Computer ads" class="list-group-item"><i class="fa fa-fw fa-Computer" aria-hidden="true"></i> Computer (0)</a>
                        <a href='/Personal/' title="Personal ads" class="list-group-item"><i class="fa fa-fw fa-Personal" aria-hidden="true"></i> Personal (2781)</a>
                        <a href='/Real_Estate/' title="Real Estate ads" class="list-group-item"><i class="fa fa-fw fa-Real Estate" aria-hidden="true"></i> Real Estate (5)</a>
                        <a href='/Marriage_Proposals/' title="Marriage Proposals ads" class="list-group-item"><i class="fa fa-fw fa-Marriage Proposals" aria-hidden="true"></i> Marriage Proposals (28)</a>
                        <!--<a href='/Massage/' title="Massage ads" class="list-group-item"><i class="fa fa-fw fa-Massage" aria-hidden="true"></i> Massage (367)</a>-->
                    </div>
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
                
        <form class="navbar-form navbar-left" action="/search.php" method="get">
                        <div class="form-group" id="addpost">
                            <input type="text" placeholder="Subject" class="form-control" name="q">
                            <textarea name="comment" form="addpost" class="form-control" placeholder="Content" ></textarea> 
                            
                            <button type="submit" class="btn btn-info">Post Now</button>
                            <sql:update dataSource = "${snapshot}" var = "result">
                                select * from advertisement limit 10;
                            </sql:update>
                        </div>
         </form>        
    </body>
</html>
