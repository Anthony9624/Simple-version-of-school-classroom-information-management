<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="com.Group4.utils.ComVariableUtils" scope="page"></jsp:useBean>

<html>
<head>
<title>���ӿγ���Ϣ</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.courseNum.value;
		var length = strNum.length;
		if(length == 0)
		{
			alert("�γ̱�Ų���Ϊ��");
			form.courseNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (!((strNum.charAt(i) >= 'a' && strNum.charAt(i) <= 'z') ||
					  (strNum.charAt(i) >= 'A' && strNum.charAt(i) <= 'Z') ||
					  (strNum.charAt(i) >= '0' && strNum.charAt(i) <= '9') ||
					   strNum.charAt(i) == '_')) {
					alert("�γ̱�Ų��Ϸ�\n����Ϊ���֣���ĸ���»���");
					form.courseNum.focus();
					return false;
				}
			}
		}
		if (form.courseName.value.length == 0) {
			alert("�γ�������Ϊ��");
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
            	<font size=6>���ӿγ���Ϣ</font>
            		<table width="300", height="160">
            		<tr><td>
            			<form id="addCourse" name="addCourseForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opCourse/addCourseOk" onsubmit="checkFrom(this);">
	            			<P> �γ̱��:<input type="text" name="courseNum" size=17/>
	            			<br>�γ�����:<input type="text" name="courseName" size=17/>
	            				ѧ��:<Select name="credit">
            						<% for (int i = 1; i <= 6; i++) {
            						%>
            						<option value=<%=i%>><%=i%>
            						<% 
            						}%>
	            					</Select>
	            			<br>�γ�����:<Select name="courseType" style="width:131px">
	            							<option value="רҵ����">רҵ����
	            							<option value="רҵѡ��">רҵѡ��
	            						</Select>
						    <br>����Ժϵ:<Select name="deptname">
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
						   	<input type="submit" value="���" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="ȡ��������" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opCourse/lookCourses&id=1')" style="width:100px;height:22px"/>
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