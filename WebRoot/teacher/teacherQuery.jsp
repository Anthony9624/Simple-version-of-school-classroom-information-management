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
       <Option value="计算机与信息技术学院">计算机与信息技术学院
       <Option value="生命科学学院">生命科学学院
       <Option value="文学院">文学院
       <Option value="法学院">法学院
       <Option value="化学化工学院">化学化工学院
       <Option value="地理科学学院">地理科学学院
       <Option value="教育学院">教育学院


    </Selcet>
    <INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>
<%  
   }
%>

</CENTER>
</BODY>
<HTML>
