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

<title>�γ�����ѯ</title>
<CENTER>
  <H1><FONT COLOR=RED>�γ�����ѯ
<BR>

  
  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cname.jsp" method = post name = form>
    <P>�γ���:<INPUT type = "text" name = "courseName" value="" size=10>
    
   <BR><BR><INPUT type="submit" value="�ύ��ѯ����" name="submit">
  </FORM>

<% }

   if(QueryType.equals("dirSearch"))
   {
   
 %>
   <title>Ŀ¼��ѯ</title>
<CENTER>
  <H1><FONT COLOR=RED>Ŀ¼��ѯ
<BR>

  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cdir.jsp" method = post name = form>
    <Select name = "department">
      <Option value="��Ϣ����ƹ���ѧԺ">��Ϣ����ƹ���ѧԺ
       <Option value="��ѧ����ѧԺ">��ѧ����ѧԺ
       <Option value="���������ѧԺ">���������ѧԺ
       <Option value="�����빤��ѧԺ">�����빤��ѧԺ
       <Option value="��е�뽻ͨѧԺ">��е�뽻ͨѧԺ
       <Option value="������">������
       <Option value="������">������

    </Selcet> 
   <BR><BR><INPUT type="submit" value="�ύ��ѯ����" name="submit">
  </FORM>
<%  
   }
%>


</CENTER>
</BODY>
</HTML>