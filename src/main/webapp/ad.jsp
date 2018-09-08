<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title></title>
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
        <script type="text/javascript">
            (adsbygoogle = window.adsbygoogle || []).push({
                google_ad_client: "ca-pub-3554298857405272",
                enable_page_level_ads: true
            });
            $.subscribe('onclicksearch', function (event, data) {
                $('#message').empty();
                var nic_Search = $('#nic_Search').val();
            });
            $.subscribe('anyerrors', function (event, data) {
                window.location = "${pageContext.request.contextPath}/LogoutUserLogin.action?";
            });
            function testf(categ) {

                alert(categ);
                alert("${pageContext.request.contextPath}/" + categ + "/");
                
            }



        </script> 

    </head>
    <body >
        <%
//            String pages="0";
//            try{
            String pages = request.getParameter("page");
            String category = request.getParameter("category");

//            }catch(Exception e){
//                pages="0";
//            } 

        %>


        <c:set var = "salary" scope = "session" value = "${2000*2}"/>
        <c:set var = "c_page" value="<%= pages%>" />  
        <c:set var = "c_category"  value="<%= category%>"  />  


        <c:set var = "from_p" scope = "session" value = "${c_page*10}"/>
        <fmt:parseNumber var="i" type="number" value="${from_p}" />
 
         
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mart"  user = "root"  password = "password"/>
        <sql:query dataSource = "${snapshot}" var = "result">
           <c:choose>
                <c:when test="${c_category == 'All'}">
                    select * from advertisement where status='ACT' and ad_category !=? limit ?,10
                </c:when>    
                <c:otherwise>
                    select * from advertisement where status='ACT' and ad_category=? limit ?,10
                </c:otherwise>
            </c:choose>
            
            <c:choose>
                <c:when test="${i lt 0}">
                    <fmt:parseNumber var="i" type="number" value="0" />
                    <sql:param  value="${c_category}" />
                    <sql:param  value="${i}" />
                </c:when>
                <c:when test="${i lt 1}">
                    <c:set var="fpage" value="false"/>
                    <sql:param  value="${c_category}" />
                    <sql:param  value="${i}" />
                </c:when>
                <c:otherwise>
                    <c:set var="fpage" value="true"/>
                    <sql:param  value="${c_category}" />
                    <sql:param  value="${i}" />
                </c:otherwise>
            </c:choose>
        </sql:query>
        <sql:query dataSource = "${snapshot}" var = "ad_count_result">
           select count(ad_category) as ad_count,ad_category from advertisement where status='ACT' group by ad_category;
        </sql:query>  
        <sql:query dataSource = "${snapshot}" var = "ad_count_all_result">
            
            <c:choose>
                <c:when test="${c_category == 'All'}">
                     select count(*) as ad_count_all from advertisement where status='ACT';
                  
                </c:when>    
                <c:otherwise>
                     select count(*) as ad_count_all from advertisement where status='ACT' and ad_category=?;
                    <sql:param  value="${c_category}" />
                </c:otherwise>
            </c:choose>
           
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
                        <a href='${pageContext.request.contextPath}/ad.jsp?category=All'  title="All ads" class="list-group-item"><i class="fa fa-fw fa-${row.ad_category}" aria-hidden="true"></i> All Ads </a>
                             
                        <c:forEach var = "row" items = "${ad_count_result.rows}">
                            <a href='${pageContext.request.contextPath}/ad.jsp?category=${row.ad_category}'  title="${row.ad_category} ads" class="list-group-item"><i class="fa fa-fw fa-${row.ad_category}" aria-hidden="true"></i> ${row.ad_category}  (${row.ad_count})</a>
                                 
                        </c:forEach>

                    </div>
                </div>
                <div class="col-md-10 ad-count">
                    <div class="col-md-12">
                        <c:forEach var = "row" items = "${ad_count_all_result.rows}">
                            <h3>  Live Ads &nbsp;(${row.ad_count_all}) </h3>
                           
                        </c:forEach>
                        <%
                            try {
                                if (request.getParameter("page").equals(null)) {
//                                out.println("<h4> Welcome to first page </h4>");

                                } else {
//                                out.println("<h4> Page "+ request.getParameter("page") +"</h4>" );
                                }
                            } catch (Exception e) {
//                                out.println("<h4> Welcome to first page </h4>");

                            }

                        %>
                    </div>
                    <div id="valueHolderId">${someValue}</div>
                    <%--<c:out value="${i}"/>--%> 
                    <%--<c:out value="${c_category}" />--%>  
                    
                    <c:forEach var = "row" items = "${result.rows}">
                        <div class="col-md-5 rounded-div">
                            <a href="${pageContext.request.contextPath}/ad_view.jsp?id=${row.id}"> 
                                <h3><c:out value = "${row.id} - ${row.ad_subject}" /></h3></a>

                            <a href="${pageContext.request.contextPath}/ad_view.jsp?id=${row.id}">
                                <img src="${pageContext.request.contextPath}${row.ad_image}" alt="picture of Massage - Full Body Massage" class="img-thumbnail" height="100" width="100">
                                
                            </a>
                            <p style="overflow:hidden;">
                                ${row.ad_content}
                                 
                                <br />
                                <span class="adtime">9 hours ago</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <br />
            <ul class="pager">
                <c:if test="${fpage eq true}">
                    <li><a href="<%=request.getContextPath()%>/ad.jsp?category=${c_category}&page=${c_page-1}"  >< Previous 10 </a></li>
                    </c:if>
                <li><a href="<%=request.getContextPath()%>/ad.jsp?category=${c_category}&page=${c_page+1}" > Next 10 ></a></li>
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
                <a href="${pageContext.request.contextPath}/contactus.jsp">Contact</a>
            </p>
        </footer> 
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>-->
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));</script>
        <script type="text/javascript">
            try {
                var pageTracker = _gat._getTracker("UA-2923101-5");
                pageTracker._trackPageview();
            } catch (err) {
            }
        </script>
    </body>
</html>

