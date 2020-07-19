<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="com.Group4.utils.ComVariableUtils" scope="page"></jsp:useBean>

<html>
<head>
<title>增加学生信息
</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.studentNum.value;
		var length = strNum.length;
		if(length == 0)
		{
			alert("学生工号不能为空");
			form.studentNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (!((strNum.charAt(i) >= 'a' && strNum.charAt(i) <= 'z') ||
					  (strNum.charAt(i) >= 'A' && strNum.charAt(i) <= 'Z') ||
					  (strNum.charAt(i) >= '0' && strNum.charAt(i) <= '9') ||
					   strNum.charAt(i) == '_')) {
					alert("学生工号不合法\n必须为数字，字母，下划线");
					form.studentNum.focus();
					return false;
				}
			}
		}
		if (form.studentName.value.length == 0) {
			alert("学生姓名不能为空");
			form.studentName.focus();
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
            	<font size=6>增加学生</font>
            		<table width="310", height="180">
            		<tr><td>
            			<form id="addStudent" name="addStudentForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opStudent/addStudentOk" onsubmit="checkFrom(this);">
	            			<P> 学生学号:<input type="text" name="studentNum" size=17/>
	            			<br>学生姓名:<input type="text" name="studentName" size=17/>
	       
						    <br>所属院系:<Select name="deptname">
						    		   <%
						    		   String strDeptnames[] = cvariable.getDeptnames();
						    		   int length = strDeptnames.length;
						    		   for (int i = 0; i < length; i++) {
						    		   %>
						    		   <option value=<%=strDeptnames[i]%>><%=strDeptnames[i]%>
						    		   <%
						    		   }%>
						   		       </Select>
						   	</P>
						   	<center>
						   	<input type="submit" value="添加" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents&id=1')" style="width:100px;height:22px"/>
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