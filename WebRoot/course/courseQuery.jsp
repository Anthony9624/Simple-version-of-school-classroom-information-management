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
      <Option value="信息与控制工程学院">信息与控制工程学院
       <Option value="化学工程学院">化学工程学院
       <Option value="经济与管理学院">经济与管理学院
       <Option value="环境与工程学院">环境与工程学院
       <Option value="机械与交通学院">机械与交通学院
       <Option value="基础部">基础部
       <Option value="体育部">体育部

    </Selcet> 
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>
<%  
   }
%>


</CENTER>
</BODY>
</HTML>