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
            select * from advertisement where status='ACT' and id = <%=request.getParameter("id")%>;
        </sql:query>
        <sql:query dataSource = "${snapshot}" var = "ad_count_result">
            select count(ad_category) as ad_count,ad_category from advertisement where status='ACT' group by ad_category;
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
                            <span>Mobile No Here</span>
                            <a class="btn btn-success" href="${pageContext.request.contextPath}/lanka.jsp">My Ads</a>
                            <a class="btn btn-sm btn-warning" href="/logout.php">Logout</a>
                        </div>
                    </form>
                    <div class="list-group-top">
                        <a href='/Automobiles/' title="Automobiles ads" class="list-group-item"><i class="fa fa-fw fa-Automobiles" aria-hidden="true"></i> Automobiles (3)</a>
                        <a href='/Business/' title="Business ads" class="list-group-item"><i class="fa fa-fw fa-Business" aria-hidden="true"></i> Business (60)</a>
                        <a href='/Electronics/' title="Electronics ads" class="list-group-item"><i class="fa fa-fw fa-Electronics" aria-hidden="true"></i> Electronics (1)</a>
                        <a href='/Employment/' title="Employment ads" class="list-group-item"><i class="fa fa-fw fa-Employment" aria-hidden="true"></i> Employment (31)</a>
                        <a href='/General/' title="General ads" class="list-group-item"><i class="fa fa-fw fa-General" aria-hidden="true"></i> General (31)</a>
                        <a href='/Mobile/' title="Mobile ads" class="list-group-item"><i class="fa fa-fw fa-Mobile" aria-hidden="true"></i> Mobile (5)</a>
                        <a href='/Computer/' title="Computer ads" class="list-group-item"><i class="fa fa-fw fa-Computer" aria-hidden="true"></i> Computer (0)</a>
                        <a href='/Personal/' title="Personal ads" class="list-group-item"><i class="fa fa-fw fa-Personal" aria-hidden="true"></i> Personal (2816)</a>
                        <a href='/Real_Estate/' title="Real Estate ads" class="list-group-item"><i class="fa fa-fw fa-Real Estate" aria-hidden="true"></i> Real Estate (5)</a>
                        <a href='/Marriage_Proposals/' title="Marriage Proposals ads" class="list-group-item"><i class="fa fa-fw fa-Marriage Proposals" aria-hidden="true"></i> Marriage Proposals (28)</a>
                        <a href='/Massage/' title="Massage ads" class="list-group-item"><i class="fa fa-fw fa-Massage" aria-hidden="true"></i> Massage (369)</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="jumbotron">
            <div class="container">
                <div class="col-md-2">
                    <a href="/"><img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Lanka Ads Logo" class="logo"></a>
                </div>
                <p>Welcome to Best & Fastest Sri Lankan Ad website. Advertise your products and services with us quickly.
                    No Registration/Sign up, Immediate approval without any restrictions.</p>
                <p>
                    We are the fastest growing online Ad network in Sri Lanka. Most popular site between young & adults.
                    <a class="btn btn-info" href="/postAd.php">Post Your Ad</a> on our site and see amazing results.
                </p>
            </div>
        </div>
        <div class="container">
            <div class="row content">
                <div class="col-md-2 sidenav">
                     
                    
                    
                    <div class="list-group">
                        <c:forEach var = "row" items = "${ad_count_result.rows}">
                            <a href="${pageContext.request.contextPath}/${row.ad_category}/"  title="${row.ad_category} ads" class="list-group-item"><i class="fa fa-fw fa-${row.ad_category}" aria-hidden="true"></i> ${row.ad_category}  (${row.ad_count})</a>
                            
                        </c:forEach> 
                        <a href="${pageContext.request.contextPath}/ad_view.jsp" title="Mobile ads" class="list-group-item"><i class="fa fa-mobile" aria-hidden="true"></i> Mobile </a>
 
                    </div>
                </div>
                <div class="col-md-10 rounded-div add-full-div">
                    <c:forEach var = "row" items = "${result.rows}">
                    <h3>${row.ad_subject}</h3>
                    <p class="classifiedTitle" align="right">
                        <a href="/Massage">Massage</a> -> <a href="/Massage/Head_Massage/">Head Massage</a>
                    </p><br />
                     
                    <p style="overflow:hidden;"><span class="classifiedText">${row.ad_content}</span></p>
                    <p><h3><i class="fa fa-fw fa-phone" aria-hidden="true"></i><a href="tel:0762105557">${row.mobile}</a></h3></p>
                    <p align="center"><img src="${pageContext.request.contextPath}${row.ad_image}" alt="Main Image" border="0" class="img-responsive img-rounded" /></p>
                    <p>Published : 4 days ago</p>
                    <hr />
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <a href="javascript:history.back(-1)"><span class="classifiedTitle">< Back</span></a>
                    <p>&nbsp;</p>
                    </c:forEach>
                </div>
            </div>
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