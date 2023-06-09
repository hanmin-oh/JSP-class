<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.tjoeun.dbcpTest.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>삭제할 글 보기</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    //memoList4.jsp에서 넘어오는 삭제할 글번호(idx)와 삭제 후 돌아갈 페이지 번호(currentPage)를 받는다.
    String tempIdx = request.getParameter("idx");
    String tempCurrentPage = request.getParameter("currentPage");

    //  1. 삭제할 글번호와 삭제 후 돌아갈 페이지 번호가 모두 넘어왔나 검사한다.
    if(tempIdx != null && tempIdx.trim().length() != 0 && tempCurrentPage != null && tempCurrentPage.trim().length() != 0) {
    //  2. 삭제할 글번호 또는 돌아갈 페이지 번호가 모두 숫자인지 검사한다.
        try {
            int idx = Integer.parseInt(tempIdx);
            int currentPage = Integer.parseInt(tempCurrentPage);

            // 3. 삭제할 글번호에 해당되는 글이 테이블에 존재하는가 확인하기 위해 글번호에 해당되는 글을 얻어온다.
            Connection conn = DBUtil.getMysqlConnection();
            String sql = "select * from memolist where idx = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tempIdx);
            ResultSet rs = pstmt.executeQuery();

            // 4. 삭제할 글이 테이블에 존재하는가 검사한다.
            if(rs.next()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd(E)");
%>
            <%-- 7 .삭제할 글이 존재하므로 삭제할 글을 화면에 보여주고 비밀번호를 입력받는다.--%>
        <form action="deletOk.jsp" method="post">
            <table width="1000" border="1" align="center" cellpadding="5" cellspacing="0">
                <tr>
                    <th colspan="5">삭제할 글 확인</th>
                </tr>
                <tr>
                    <th width="80">글 번호</th>
                    <th width="100">이름</th>
                    <th width="840">메모</th>
                    <th width="120">작성일</th>
                    <th width="80">ip</th>
                </tr>
                <tr>
                    <td align="center"><%=rs.getInt("idx")%></td>
                    <td align="center"><%=rs.getString("name").replace("<" , "&lt;") %></td>
                    <td><%=rs.getString("memo").replace("<" , "&lt;") %></td>
                    <td align="center"><%=sdf.format(rs.getTimestamp("writeDate")) %></td>
                    <td><%=rs.getString("ip") %></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <label>
                            비밀번호 <input type="password" name="password"/>
                        </label>
                        <input type="submit" value="삭제" >
                        <input type="reset" value="다시쓰기">
                        <input type="submit" value="돌아가기1" onclick="history.back()">
                        <input type="submit" value="돌아가기2" onclick="history.go(-1)">
                        <input type="submit" value="돌아가기3" onclick="location.href='memoList4.jsp?currentPage=<%=currentPage%>'">
                    </td>
                </tr>
            </table>
            <%-- 삭제할 글번호와 삭제 후 돌아갈 페이지 번호도 deleteOk.jsp로 넘겨줘야 한다. --%>
            <input type="hidden" name="idx" value="<%=rs.getInt("idx")%>"/>
            <input type="hidden" name="currentPage" value="<%=currentPage%>"/>
        </form>
<%          } else {
                //삭제할 글이 테이블에 존재하지 않기 대문에 에러 메시지를 출력하고 memoList4로 돌려보낸다.
                out.println("<script>");
                out.println("alert('" + idx + "번 글은 테이블에 존재하지 않습니다.')");
                out.println("location.href='memoList4.jsp'");
                out.println("</script>");
            }
            DBUtil.close(conn);
        }catch (NumberFormatException e) {
            //삭제할 글번호 또는 돌아갈 페이지 번호가 숫자가 아니므로 에러 메시지를 출력하고 memoList4로 돌려보낸다.
            out.println("<script>");
            out.println("alert('삭제할 글번호 또는 돌아갈 페이지 번호가 모두 숫자가 아닙니다.')");
            out.println("location.href='memoList4.jsp'");
            out.println("</script>");
        }
    } else {
       // 삭제할 글번호 또는 돌아갈 페이지 번호가 넘어오지 않았으므로 에러 메시지를 출력하고 memoList4.jsp로 돌려보낸다.
        out.println("<script>");
        out.println("alert('삭제할 글번호 또는 돌아갈 페이지 번호가 넘어오지 않았습니다.')");
        out.println("location.href='memoList4.jsp'");
        out.println("</script>");
    }
%>


</body>
</html>
