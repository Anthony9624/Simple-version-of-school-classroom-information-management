<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*" errorPage=""%>

<HTML>
	<HEAD>
		<TITLE>�޸�����</TITLE>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script language="javascript">
function checkform(){
    var frm=document.form7	
	if(frm.userpasswd.value==""){
		alert("������ԭ���룡");
		return false;
	}

	if(frm.alterpwd1.value==""){
		alert("�����������룡");
		return false;
	}

	if(frm.alterpwd2.value==""){
	alert("���ٴ����������룡");
	return false;
	}

	if(frm.userpasswd.value.length<2||frm.userpasswd.value.length>18||frm.alterpwd1.value.length<2||frm.alterpwd1.value.length>18||frm.alterpwd2.value.length<2||frm.alterpwd2.value.length>18){
	alert("����ĳ��Ȳ����Ϲ�����������룡");
	return false;
	}
	
	if(!((frm.userpasswd.value>="0"&&frm.userpasswd.value<":")||(frm.userpasswd.value>="a"&&frm.userpasswd.value<"{")||(frm.userpasswd.value>="A"&&frm.userpasswd.value<"["))||!((frm.alterpwd1.value>="0"&&frm.alterpwd1.value<":")||(frm.alterpwd1.value>="a"&&frm.alterpwd1.value<"{")||(frm.alterpwd1.value>="A"&&frm.alterpwd1.value<"["))||!((frm.alterpwd2.value>="0"&&frm.alterpwd2.value<":")||(frm.alterpwd2.value>="a"&&frm.alterpwd2.value<"{")||(frm.alterpwd2.value>="A"&&frm.alterpwd2.value<"["))){
	alert("����������к��зǷ��ַ������������룡");
	return false;
	}

	if(frm.alterpwd1.value!=frm.alterpwd2.value){
	alert("������������벻һ�£����������룡");
	return false;
	}
	
	return true;
}
</script>

		<style type="text/css">
<!--
.STYLE8 {
	font-family: "����_GB2312"
}

.STYLE9 {
	font-family: "����";
	font-weight: bold;
}

#Layer1 {
	position: absolute;
	width: 200px;
	height: 115px;
	z-index: 1;
	left: 146px;
	top: 80px;
}
-->
</style>
	</HEAD>
	<BODY>
		<%
			Connection con;
			Statement sql;
			ResultSet rs;
			String user = (String) session.getAttribute("userName");
			String type = (String) session.getAttribute("role");

			try {
				Class.forName("com.mysql.jdbc.Driver");

			} catch (Exception e) {
				out.print(e);
			}
			String uri = "jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8";
			String username = "root";
			String password = "root";
			con = DriverManager.getConnection(uri, username, password);
			sql = con.createStatement();
			rs = sql.executeQuery("select * from admin where userName ='"
					+ user + "'");

			if (user != null) {
				rs.next();
		%>

		<form name="form7" method="post"
			action="alterpasswdok.jsp?alteruser=<%=user%>"
			onSubmit="checkform()"> 
            <div align="center">
			<p><font size="5"><strong>�޸��ҵ�����</strong></font></p>
					<p><font size="4">�û���:</font>:<%=user%></p>
					<p><font size="4">ԭ����:</font><input name="userpasswd" type="password" >	</p>		
					<p><font size="4">������:</font><input name="alterpwd1" type="password" ></p>			
					<p><font size="4">�ظ�����������:</font><input name="alterpwd2" type="password" ></p>		
						<span style="background-color: rgb(192, 192, 192);">
						&ldquo;����&rdquo;����ĸa��z������0��9��ɣ�����Ϊ2��18���ַ���</span> 
	                     <p><font color="#ffffff">3</font></p>	
									<div align="center">
										<label>
											<input type="submit" name="submit" value="ȷ���޸�" />
											&nbsp;&nbsp;
										</label>
										<label>
											<input type="reset" name="reset" value="��������" />
										</label>
									</div>
							</div>
		</form>
		<%
			rs.close();
				sql.close();
				con.close();
		%>

		<%
			} else {
				response.sendRedirect("welcome.jsp");
			}
		%>


	</BODY>
</HTML>
