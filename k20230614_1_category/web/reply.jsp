<%@ page import="com.tjoeun.service.CategoryService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="vo" class="com.tjoeun.vo.CategoryVO">
    <jsp:setProperty  property="*" name="vo"/>
</jsp:useBean>
${vo}<br/>

<%
    // categoryView2.jsp에서 넘겨받은 서브 카테고리 정보를 테이블에 저장하는 메소드를 호출한다.
    CategoryService.getInstance().reply(vo);
    // 서브 카테고리를 저장했으므로 화면에 출력할 카테고리 목록을 얻어오는 페이지(list.jsp)로 넘겨준다.
//    response.sendRedirect("list.jsp");
%>

${vo}

</body>
</html>
