<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="com.Group4.opdb.OpConnetDB" scope="page"></jsp:useBean>

<html>
<head>
<title>修改课程信息
</title>
<%!
	boolean isUpdateOk = false;
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String courseNum   = (String)request.getParameter("courseNum");
	String courseName  = (String)request.getParameter("courseName");
	byte b1[] = courseName.getBytes("ISO-8859-1");
	courseName = new String(b1);
	int iCredit = Integer.parseInt((String)request.getParameter("credit"));
	String strType     = (String)request.getParameter("courseType");
	byte b2[] = strType.getBytes("ISO-8859-1");
	strType = new String(b2);
	String strDeptname = (String)request.getParameter("deptname");
	byte b3[] = strDeptname.getBytes("ISO-8859-1");
	strDeptname = new String(b3);
	
	String strUpdate = "update Course set cname='";
	strUpdate += courseName+"',credit="+iCredit+",category='"+strType+"',deptname='"+strDeptname+"' ";
	strUpdate += "where cno='"+courseNum+"'";
	dbCourse.connect("CmisDB");
	isUpdateOk = dbCourse.updateDB(strUpdate);
    dbCourse.disConnect();
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table width="700", height="350">
            <tr><td>
            	<% if (isUpdateOk) {
            	%>
            	<center>
            	<font size=6>修改课程信息成功!</font>
            	<table width="270", height="200">
            	
            	<tr><td>
            	<font size=4>
           	     课程编号:<%=courseNum%><br>
           	     课程名称:<%=courseName%><br>&nbsp;
           	         学&nbsp;分&nbsp;:<%=iCredit%><br>
           	     课程类型:<%=strType%><br>
           	         所属院系:<%=strDeptname%><br><br>
            	</font>
          			<center>
				   	<input type="button" value="查看课程信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opCourse/lookCourses')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>修改课程失败!</font>
            	<table width="270", height="200">
            	<tr><td>
          			<center>
          			<font size=4>
            		原因:未知名错误!
            		</font>
          			<br><br><br>
				   	<input type="button" value="返回后台首页" onclick="window.location.href('<%=basePath%>admin/index.jsp')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	}%>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>