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
 
        <link href="${pageContext.request.contextPath}/style.css?10.1" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/font-awesome-4.6.3/css/font-awesome.min.css"/>
        <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" />
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <script src="${pageContext.request.contextPath}/font-awesome-4.6.3/js/timeago.js" type="text/javascript"></script>
        

    </head>
    <body >
        <%
 
            String pages = request.getParameter("page");
            String category = request.getParameter("category");
            String  search = request.getParameter("search");
            String  query,count_query = "";
            try{
            if (search.isEmpty()){
                search="1=1";
                query="select * from advertisement where status='ACT' and ( ? ) limit ?,10";
                count_query ="select count(*) as ad_count_all from advertisement where status='ACT'";
            }else{
//                search= "ad_subject like '%"+search+"%' or ad_content like '%"+search+"%'";
                search= "%"+search+"%";
                query="select * from advertisement where status='ACT' and (ad_content like ? or ad_subject like '"+search+"' ) limit ?,10";
                count_query ="select count(*) as ad_count_all from advertisement where status='ACT' and (ad_content like '"+search+"' or ad_subject like '"+search+"' )";
            }
            }catch(Exception e){
                e.printStackTrace();
                search="1=1";
                query="select * from advertisement where status='ACT' and ( ? ) limit ?,10";
                count_query ="select count(*) as ad_count_all from advertisement where status='ACT'";
            }  
            System.out.print(search);
        %>


        <c:set var = "salary" scope = "session" value = "${2000*2}"/>
        <c:set var = "c_page" value="<%= pages%>" />  
        <c:set var = "c_category"  value="<%= category%>"  />   
        <c:set var = "c_search"  value="<%= search%>"  />   
        <c:set var = "query"  value="<%= query%>"  />   
        <c:set var = "count_query"  value="<%= count_query%>"  />   
 
        <c:set var = "from_p" scope = "session" value = "${c_page*10}"/>
        <fmt:parseNumber var="i" type="number" value="${from_p}" />
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mart"  user = "root"  password = "password"/>
        <sql:query dataSource = "${snapshot}" var = "result">
            ${query}
            <c:choose>
                <c:when test="${i lt 0}">
                    <fmt:parseNumber var="i" type="number" value="0" />
                    <sql:param  value="${c_search}" />
                    <sql:param  value="${i}" />
                </c:when>
                <c:when test="${i lt 1}">
                    <c:set var="fpage" value="false"/>
                    <sql:param  value="${c_search}" />
                    <sql:param  value="${i}" />
                </c:when>
                <c:otherwise>
                    <c:set var="fpage" value="true"/>
                    <sql:param  value="${c_search}" />
                    <sql:param  value="${i}" />
                </c:otherwise>
            </c:choose>
        </sql:query>
        <sql:query dataSource = "${snapshot}" var = "ad_count_result">
            select count(ad_category) as ad_count,ad_category from advertisement where status='ACT' group by ad_category;
        </sql:query>  
        <sql:query dataSource = "${snapshot}" var = "ad_count_all_result">
           ${count_query}
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
                    <form class="navbar-form navbar-right" action="searchServlet" method="post" name="searchform">
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
                    <a href="index.jsp"><img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Lanka Ads Logo" class="logo"></a>
                </div>
            </div>
        </div>
                
        <div class="container">
            <div class="row content">
                <div class="col-md-2 sidenav"> 
                    <div class="list-group">   
                        
                        
                        
                        
                        <a href='${pageContext.request.contextPath}/ad.jsp?category=All'  title="All ads" class="list-group-item"><i class="fa fa-fw fa-${row.ad_category}" aria-hidden="true"></i> All Ads</a>
                        <c:forEach var = "row" items = "${ad_count_result.rows}">
                            <a href='${pageContext.request.contextPath}/ad.jsp?category=${row.ad_category}' title="${row.ad_category} ads" class="list-group-item"><i class="fa fa-fw fa-${row.ad_category}" aria-hidden="true"></i> ${row.ad_category}  (${row.ad_count})</a>
                        </c:forEach>

                    </div>
                </div>
                <div class="col-md-10 ad-count">
                    <div class="col-md-12">
                        <c:forEach var = "row" items = "${ad_count_all_result.rows}">
                            <h3>  Live Ads &nbsp;(${row.ad_count_all}) </h3>
                            <!--<h4> Hello <b><!%= request.getParameter("page")%></b>!</h4>-->
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
                    <%--<c:out value="${query}"/>--%>  
                    <%--<c:out value="${c_search}"/>--%>  
                    <abbr class="timeago" title="19 March 2013 04:51:33 PM"></abbr>
                    
                    
                     
                    <c:forEach var = "row" items = "${result.rows}">
                        <div class="col-md-5 rounded-div">
                            <a href="${pageContext.request.contextPath}/ad_view.jsp?id=${row.id}">
                                <!--<h3>New Therapy massage</h3></a>-->
                                <h3><c:out value = "${row.id} - ${row.ad_subject} - ${row.ad_category}" /></h3></a>

                            <a href="${pageContext.request.contextPath}/ad_view.jsp?id=${row.id}">
                                <img src="${pageContext.request.contextPath}${row.ad_image}" alt="picture of Massage - Full Body Massage" class="img-thumbnail" height="100" width="100">
                                <%--<c:out value = "${row.ad_image}" />--%>
                            </a>
                            <p style="overflow:hidden;">
                                ${row.ad_content}
                                <%--<c:out value = "${row.ad_content}" />--%>
                                <!--I'm boy. Full body massage,foot massages,head massage and relaxation filing massage. Only Griles and women. Hotel visits and home visits. Cll me......-->
                                <br />
                                <span class="adtime">9 hours ago</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <br />
            <ul class="pager">
                <c:if test="${fpage eq true}">
                    <li><a href="<%=request.getContextPath()%>/?page=${c_page-1}"  >< Previous 10 </a></li>
                    </c:if>
                <li><a href="<%=request.getContextPath()%>/?page=${c_page+1}" > Next 10 ></a></li>
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

