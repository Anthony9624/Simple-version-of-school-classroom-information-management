<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="com.Group4.utils.ComVariableUtils" scope="page"></jsp:useBean>

<html>
<head>
<title>增加课程信息</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.courseNum.value;
		var length = strNum.length;
		if(length == 0)
		{
			alert("课程编号不能为空");
			form.courseNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (!((strNum.charAt(i) >= 'a' && strNum.charAt(i) <= 'z') ||
					  (strNum.charAt(i) >= 'A' && strNum.charAt(i) <= 'Z') ||
					  (strNum.charAt(i) >= '0' && strNum.charAt(i) <= '9') ||
					   strNum.charAt(i) == '_')) {
					alert("课程编号不合法\n必须为数字，字母，下划线");
					form.courseNum.focus();
					return false;
				}
			}
		}
		if (form.courseName.value.length == 0) {
			alert("课程名不能为空");
			form.courseName.focus();
			return false;
		}
		return true;
	}
	</script>
	<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        	<tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>增加课程信息</font>
            		<table width="300", height="160">
            		<tr><td>
            			<form id="addCourse" name="addCourseForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opCourse/addCourseOk" onsubmit="checkFrom(this);">
	            			<P> 课程编号:<input type="text" name="courseNum" size=17/>
	            			<br>课程名称:<input type="text" name="courseName" size=17/>
	            				学分:<Select name="credit">
            						<% for (int i = 1; i <= 6; i++) {
            						%>
            						<option value=<%=i%>><%=i%>
            						<% 
            						}%>
	            					</Select>
	            			<br>课程类型:<Select name="courseType" style="width:131px">
	            							<option value="专业必修">专业必修
	            							<option value="专业选修">专业选修
	            						</Select>
						    <br>所属院系:<Select name="deptname">
						    		   <%
						    		   String strTemp[] = cvariable.getDeptnames();
						    		   int length = strTemp.length;
						    		   for (int i = 0; i < length; i++) {
						    		   %>
						    		   <option value=<%=strTemp[i]%>><%=strTemp[i]%>
						    		   <%
						    		   }%>
						   		       </Select>
						   	</P>
						   	<center>
						   	<input type="submit" value="添加" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opCourse/lookCourses&id=1')" style="width:100px;height:22px"/>
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