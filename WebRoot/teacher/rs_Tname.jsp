<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="com.Group4.dao.ConnetDBDao" scope="page"/>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>

<style type="text/css">
.Tab th{ border-collapse:collapse; 
      border:solid 1px #f00
     }
.Tab td{ border-collapse:collapse; border:solid 1px #f00}
</style>


<BODY>
<center>
<% String str = request.getParameter("teacherName");
    byte b[] = str.getBytes("ISO-8859-1");
    str = new String(b);
    String s = "select Teacher.tno,tname,sex,Teacher.deptname,Course.cname,Schedule.clno,weekday,period "+
    "from Teacher,Course,Schedule where Teacher.tno=Schedule.tno AND Course.cno=Schedule.cno and tname='"+str+"'";
    ResultSet rs = result.connetSQL(s);
    
    
    out.print("<B><font size=4>"+"��ʦ������Ϣ");
    out.print("<BR><BR>");
	
	out.println("<table width = '60%' cellspacing='0' cellpadding='0'  class = Tab> ");
	out.println("<tr>");
	out.println("<th>��ʦ���</th>");
	out.println("<th>��ʦ����</th>");
	out.println("<th>�Ա�</th>");
	out.println("<th>����Ժϵ</th>");

	out.println("<th>�γ���</th>");
	out.println("<th>�Ͽεص�</th>");
	out.println("<th>�Ͽ�ʱ��</th>");
	out.println("<th>�ڴ�</th>");

	out.println("</tr>");
	while(rs.next()) {
	   out.print("<tr>");
	   out.println("<td align = center>"+rs.getString(1)+"</td>");
	   out.println("<td align = center>"+rs.getString(2)+"</td>");
	   out.println("<td align = center>"+rs.getString(3)+"</td>");
	   out.println("<td align = center>"+rs.getString(4)+"</td>");
	   out.println("<td align = center>"+rs.getString(5)+"</td>");
       out.println("<td align = center>"+rs.getString(6)+"</td>");
	   out.println("<td align = center>"+rs.getString(7)+"</td>");
	   out.println("<td align = center>"+rs.getString(8)+"</td>");
	 

	 
	   out.print("</tr>");
	}
 
	    
%>
<table>
<td height=70>
<a href="teacher.jsp">����</a>
</td>
</table>
</CENTER>
</BODY>
<HTML>