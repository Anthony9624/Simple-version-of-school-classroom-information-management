<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="cvariable" class="com.Group4.utils.ComVariableUtils" scope="page"></jsp:useBean>
<jsp:useBean id="dbCourse" class="com.Group4.opdb.OpConnetDB" scope="page"></jsp:useBean>

<html>
<head>
<title>修改课程信息
</title>
	<script>
	function checkFrom(form) 
	{
		if (form.courseName.value.length == 0) {
			alert("课程名不能为空");
			form.courseName.focus();
			return false;
		}
		return true;
	}
	</script>
  <%
	String strCno=(String)request.getParameter("cno");
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
    String strQuery = "SELECT * FROM Course ";
    strQuery += "where cno='"+strCno+"'";
    dbCourse.connect("CmisDB");
    ResultSet rs = dbCourse.queryDB(strQuery);
    String strName = "";
    int iCredit = 1;
    String strCategory = "";
    String strDeptment = "";
    
    if (rs.next()) {
    	strName = rs.getString(2);
    	iCredit = rs.getInt(3);
    	strCategory = rs.getString(4);
    	strDeptment = rs.getString(5);
    }
  %>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>修改课程信息</font>
            	<table width="300", height="160">
            	<tr><td>
            		<form id="alterCourse" name="alterCourseForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opCourse/alterCourseOk">
            			<P> 课程编号:<input type="text" value="<%=strCno%>" name="courseNum" readOnly="true" size=17/>
            			<br>课程名称:<input type="text" name="courseName" value="<%=strName%>" size=17/>
            				学分:<Select name="credit">
            						<% for (int i = 1; i <= 6; i++) {
            							if (iCredit == i) {%>
            						    	<option value=<%=i%> selected><%=i%>
            							<%
            							} else {
            							%>
            								<option value=<%=i%>><%=i%>
            							<%}
            						}%>
	            				</Select>
	            		<br>课程类型:<Select name="courseType" style="width:131px">
	            							<% if (strCategory.trim().equals("专业必修")) {
	            							%>
	            								<option value="专业必修" selected>专业必修
	            								<option value="专业选修">专业选修
	            							<% 
	            							} else {%>
	            								<option value="专业必修">专业必修
	            								<option value="专业选修" selected>专业选修
	            							<% 
	            							}%>
	            						</Select>
					    <br>所属院系:<Select name="deptname">
					    		   <%
					    		   String strTemp[] = cvariable.getDeptnames();
					    		   int length = strTemp.length;
					    		   for (int i = 0; i < length; i++) {
					    		       if (strDeptment.trim().equals(strTemp[i])) {
					    		   %>
					    		   	   <option value=<%=strTemp[i]%> selected><%=strTemp[i]%>
					    		   	   <% 
					    		   	   } else {%>
					    		   	   <option value=<%=strTemp[i]%>><%=strTemp[i]%>
					    		   	   <%
					    		   	   }%>
					    		   <%
					    		   }%>
					   		       </Select>
						   	</P>
						<center>
						   	<input type="submit" value="保存" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opCourse/lookCourses')" style="width:100px;height:22px"/>
						</center>
            		</form>
            	</td></tr>
            	</table>
            	</center>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>