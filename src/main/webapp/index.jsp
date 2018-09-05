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
            <sql:query dataSource = "${snapshot}" var = "result">
                select * from advertisement limit 10;
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
                    <a class="navbar-brand" href="/">Brand Goes Here</a>
                    &nbsp;&nbsp;
                    <span class="top-fb">
                        <a class="btn btn-sm btn-info" href="${pageContext.request.contextPath}/postAd.jsp">Post Your Ad</a>
                    </span>
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
<!--                <div class="col-md-10">  // Suggestions
                    <table style="width:100%">
                        <tr height='20px'>
                            <td><p class="menu01"><a href="/Massage/Head_Massage/">Head Massage</a></p></td>
                            <td><p class="menu01"><a href="/Massage/Foot_Massage/">Foot Massage</a></p></td>
                            <td><p class="menu01"><a href="/Massage/Full_Body_Massage/">Full Body Massage</a></p></td>
                        </tr>
                        <tr height='20px'>
                            <td><p class="menu01"><a href="/Massage/Swedish_Massage/">Swedish Massage</a></p></td>
                            <td><p class="menu01"><a href="/Massage/Thai_Massage/">Thai Massage</a></p></td>
                            <td><p class="menu01"><a href="/Massage/Aromatherapy_Massage/">Aromatherapy Massage</a></p></td>
                        </tr>
                        <tr height='20px'>
                            <td><p class="menu01"><a href="/Massage/Sports_Massage/">Sports Massage</a></p></td>
                            <td><p class="menu01"><a href="/Massage/Deep_Tissue_Massage/">Deep Tissue Massage</a></p></td>
                            <td><p class="menu01"><a href="/Massage/Nuru_Massage/">Nuru Massage</a></p></td>
                        </tr>
                        <tr height='20px'>
                            <td><p class="menu01"><a href="/Massage/Couple_Message/">Couple Message</a></p></td>
                            <td><p class="menu01"><a href="/Massage/VIP_Massage/">VIP Massage</a></p></td>
                    </table>
                </div>-->
            </div>
        </div>
        <div class="container">
            <div class="row content">
                <div class="col-md-2 sidenav">
                    <div class="list-group">
                        <a href='/Automobiles/' title="Automobiles ads" class="list-group-item"> Automobiles (3)</a>
                        <a href='/Business/' title="Business ads" class="list-group-item"><i class="fa fa-fw fa-Business" aria-hidden="true"></i>Business (59)</a>
                        <a href='/Electronics/' title="Electronics ads" class="list-group-item"><i class="fa fa-fw fa-Electronics" aria-hidden="true"></i>Electronics (1)</a>
                        <a href='/Employment/' title="Employment ads" class="list-group-item"><i class="fa fa-fw fa-Employment" aria-hidden="true"></i>Employment (31)</a>
                        <a href='/General/' title="General ads" class="list-group-item"><i class="fa fa-fw fa-General" aria-hidden="true"></i>General (31)</a>
                        <a href='/Mobile/' title="Mobile ads" class="list-group-item"><i class="fa fa-fw fa-Mobile" aria-hidden="true"></i>Mobile (4)</a>
                        <a href='/Computer/' title="Computer ads" class="list-group-item"><i class="fa fa-fw fa-Computer" aria-hidden="true"></i>Computer (0)</a>
                        <a href='/Personal/' title="Personal ads" class="list-group-item"><i class="fa fa-fw fa-Personal" aria-hidden="true"></i>Personal (2781)</a>
                        <a href='/Real_Estate/' title="Real Estate ads" class="list-group-item"><i class="fa fa-fw fa-Real Estate" aria-hidden="true"></i>Real Estate (5)</a>
                        <a href='/Marriage_Proposals/' title="Marriage Proposals ads" class="list-group-item"><i class="fa fa-fw fa-Marriage Proposals" aria-hidden="true"></i>Marriage Proposals (28)</a>
                        <!--<a href='/Massage/' title="Massage ads" class="list-group-item"><i class="fa fa-fw fa-Massage" aria-hidden="true"></i>Massage (367)</a>-->
                        <div align="center" class="left-add">
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <ins class="adsbygoogle" style="display:inline-block;width:160px;height:600px" data-ad-client="ca-pub-3554298857405272" data-ad-slot="8553495964"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                        </div>
                    </div>
                </div>
                <div class="col-md-10 ad-count">
                    <div class="col-md-12">
                        <h3>  Live Ads &nbsp;(367) </h3>
                        <!--<h4> Hello <b><!%= request.getParameter("page")%></b>!</h4>-->
                        
                        <%
                            try{
                                if(request.getParameter("page").equals(null)){
//                                out.println("<h4> Welcome to first page </h4>");
                            }else{
//                                out.println("<h4> Page "+ request.getParameter("page") +"</h4>" );
                            }
                            }catch(Exception e){
//                                out.println("<h4> Welcome to first page </h4>");
                            }
                    
                    %>
                    </div>
                    
                    
<!--                    <div class="col-md-10 rounded-div" style="min-height: auto">
                        <div align="center">
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

                            <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-3554298857405272" data-ad-slot="9111899169" data-ad-format="auto"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                        </div>
                    </div>-->
                    
                    
                     <c:forEach var = "row" items = "${result.rows}">
                    <div class="col-md-5 rounded-div">
                        <a href="/ad/New-Therapy--massage/${row.id}">
                            <!--<h3>New Therapy massage</h3></a>-->
                            <h3><c:out value = "${row.id} - ${row.ad_subject}" /></h3></a>
                        <a href="/ad/New-Therapy--massage/${row.id}">
                            <img src="${pageContext.request.contextPath}${row.ad_image}" alt="picture of Massage - Full Body Massage" class="img-thumbnail" height="100" width="100">
                            <%--<c:out value = "${row.ad_image}" />--%>
                        </a>
                        <p style="overflow:hidden;">
                            <c:out value = "${row.ad_content}" />
                            <!--I'm boy. Full body massage,foot massages,head massage and relaxation filing massage. Only Griles and women. Hotel visits and home visits. Cll me......-->
                            <br />
                            <span class="adtime">9 hours ago</span>
                    </div>
                    </c:forEach>
                </div>   
            <br/>
            <ul class="pager">
                <li><a href="${pageContext.request.contextPath}?page=1"> Next 10 > </a></li>
            </ul>
            <hr />
        </div>
        <footer class="col-md-8 col-md-offset-2">
            <p style="float:right">&copy; 2018 Lanka Ads</p>
            <p class="footer-links">
                <a href="/">Home</a>
                <a href="/postAd.php">Post Ad</a>
                <a href="/terms.php">Terms & Conditions</a>
                <a href="/privacy-policy.php">Privacy Policy</a>
                <a href="/contact.php">Contact</a>
            </p>
        </footer> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
            try {
                var pageTracker = _gat._getTracker("UA-2923101-5");
                pageTracker._trackPageview();
            } catch (err) {
            }
        </script>
    </body>
</html>

