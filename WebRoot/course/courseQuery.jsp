<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="com.Group4.dao.ConnetDBDao" scope="session"/>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>
<BODY>


<% String QueryType = request.getParameter("search");
   if(QueryType==null)
   {
     QueryType="";
   }
   if(QueryType.equals("nameSearch"))
   {
%>

<title>课程名查询</title>
<CENTER>
  <H1><FONT COLOR=RED>课程名查询
<BR>

  
  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cname.jsp" method = post name = form>
    <P>课程名:<INPUT type = "text" name = "courseName" value="" size=10>
    
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>

<% }

   if(QueryType.equals("dirSearch"))
   {
   
 %>
   <title>目录查询</title>
<CENTER>
  <H1><FONT COLOR=RED>目录查询
<BR>

  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cdir.jsp" method = post name = form>
    <Select name = "department">
      <Option value="计算机与信息技术学院">计算机与信息技术学院
       <Option value="生命科学学院">生命科学学院
       <Option value="法学院">法学院
       <Option value="化学与化工学院">化学与化工学院
       <Option value="文学院">文学院
       <Option value="地理科学学院">地理科学学院
       <Option value="教育部">教育部

    </Selcet> 
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>
<%  
   }
%>


</CENTER>
</BODY>
</HTML>
