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

<script language="javascript">
  function checkInput(form)
  {
    if(form.teacherName.value=="")
    { 
       alert("姓名不能为空");
       form.teacherName.focus();
       return false;  
    }
    return true ;
  } 
</script>

<% String QueryType = request.getParameter("search");
   if(QueryType==null)
   {
     QueryType="";
   }
   if(QueryType.equals("nameSearch"))
   {
%>

<title>教师姓名查询</title>
<CENTER>
  <H1><FONT COLOR=RED>教师姓名查询
<BR>

  
  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Tname.jsp"  name = "form" onsubmit="checkInput(this);">
    <P>姓名:<INPUT type = "text" name = "teacherName" value="" size=10>
    
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>

<% }

   if(QueryType.equals("dirSearch"))
   {
   
 %>
   <title>教师 目录查询</title>
<CENTER>
  <H1><FONT COLOR=RED>目录查询
<BR>

  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Tdir.jsp" method = post name = form>
    <Select name = "department">
       <Option value="信息与控制工程学院">信息与控制工程学院
       <Option value="化学工程学院">化学工程学院
       <Option value="经济与管理学院">经济与管理学院
       <Option value="环境与工程学院">环境与工程学院
       <Option value="机械与交通学院">机械与交通学院
       <Option value="基础部">基础部
       <Option value="体育部">体育部


    </Selcet>
    <INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>
<%  
   }
%>

</CENTER>
</BODY>
<HTML>