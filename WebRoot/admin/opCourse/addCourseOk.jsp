<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="com.Group4.opdb.OpConnetDB" scope="page"></jsp:useBean>

<html>
<head>
<title>增加课程信息
</title>
<%!
	boolean isHave = false; 
	boolean isAddOk = false;
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
	
	//先查询如果没有再插入数据
	String strQuery = "SELECT * FROM Course ";
	strQuery += "where cno='"+courseNum+"'";
	dbCourse.connect("CmisDB");
	isHave = dbCourse.queryDBHave(strQuery);
	if (!isHave) {
		isAddOk = dbCourse.updateDB("insert into Course values('"+courseNum+"','"+courseName+"',"+
									 iCredit+",'"+strType+"','"+strDeptname+"')");
        dbCourse.disConnect();
	}
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<% if (isHave == false && isAddOk) {
            	%>
            	<center>
            	<font size=6>添加课程信息成功!</font>
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
				   	<input type="button" value="继续添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opCourse/addCourse')" style="width:125px;height:22px"/>
				   	<input type="button" value="查看课程信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opCourse/lookCourses&id=1')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>添加课程失败!</font>
            	<table width="270", height="200">
            	<tr><td>
          			<center>
          			<font size=4>
          			<% if (isHave == true) {
          			%>
            		原因:课程编号已经存在!
            		<% 
            		} else  {
            		%>
            		原因:未知名错误!
            		<% 
            		}%>
            		</font>
          			<br><br><br>
				   	<input type="button" value="重新添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opCourse/addCourse')" style="width:125px;height:22px"/>
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