<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="com.Group4.dao.ConnetDBDao" scope="page"/>

<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>

<BODY>
<title>空教室查询</title>
<a href="../welcome.jsp">返回</a>
<CENTER>
  <H1><FONT COLOR=RED>空教室查询
  <br>
  
<BR>
  
  <FONT Size=4 COLOR=black>
  <FORM action="rs_free.jsp" method = post name = form>
    <table border=1 bordercolor = green width = 30%>
    <td>教学楼:
    <Select name = "classroom">
       <Option value="第一教学楼">第一教学楼</Option>
       <Option value="第二教学楼">第二教学楼</Option>
       <Option value="文科楼">文科楼</option>
    </Selcet> 
    </td>
    <td>
    星期:
    <Select name = "weekday">
       <Option value="星期一">星期一</Option>
       <Option value="星期二">星期二</Option>
       <Option value="星期三">星期三</Option>
       <Option value="星期四">星期四</Option>
       <Option value="星期五">星期五</Option>
       <Option value="星期六">星期六</Option>
       <Option value="星期日">星期日</Option>
    </Selcet>
    </td>
    <td>空闲时间段:
		  <select name="period">
		     <option value="一二节">一二节</option>
		     <option value="三四节">三四节</option>
		     <option value="五六节">五六节</option>
		     <option value="七八节">七八节</option>
		     <option value="九十节">九十节</option>
		  </select></td>
    <td>
    <INPUT type="submit" value="查看" name="submit">
    </td>
   </table>
  </FORM>
  
</CENTER>
</BODY>
<HTML>
