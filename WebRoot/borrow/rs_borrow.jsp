<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="com.Group4.opdb.OpConnetDB" scope="page"/>
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
<title>教室借用</title>

<CENTER>
 
 <% Connection con;
	Statement sql;
    String clno = request.getParameter("clno");
    String dateStr = request.getParameter("date");
    String weekday = request.getParameter("weekday");
    String period = request.getParameter("period");
    String usefor = request.getParameter("usefor");
    
    byte b1[] = weekday.getBytes("ISO-8859-1");
     weekday = new String(b1);
     
     byte b2[] = period.getBytes("ISO-8859-1");
     period = new String(b2);
     
     byte b3[] = usefor.getBytes("ISO-8859-1");
     usefor = new String(b3);
     String user = (String)session.getAttribute("userName");
     try {
				Class.forName("com.mysql.jdbc.Driver");

			} 
	 catch (Exception e) {
				out.print(e);
			}
			String uri = "jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8";
			String username = "root";
			String password = "root";
			con = DriverManager.getConnection(uri, username, password);
			sql = con.createStatement();
			String str = "insert into Borrow values('"+clno+"','"+user+"','"+dateStr+"','"+period+"','"+usefor+"','F')";
			int m=sql.executeUpdate(str);
            if(m!=0){
      
        out.println("申请 已发出, 等待管理员批准 ……");
       
        }
   %>
   <table>
     <td height=70>
      <a href="welcome.jsp">返回</a>
    </td>
  </table>
 
<BR>

</CENTER>
</BODY>
</HTML>