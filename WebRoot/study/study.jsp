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
<title>�ս��Ҳ�ѯ</title>
<a href="../welcome.jsp">����</a>
<CENTER>
  <H1><FONT COLOR=RED>�ս��Ҳ�ѯ
  <br>
  
<BR>
  
  <FONT Size=4 COLOR=black>
  <FORM action="rs_free.jsp" method = post name = form>
    <table border=1 bordercolor = green width = 30%>
    <td>��ѧ¥:
    <Select name = "classroom">
       <Option value="��ѧ¥">��ѧ¥</Option>
       <Option value="ʵ��¥">ʵ��¥</Option>
       <Option value="�ݷ�¥">�ݷ�¥</option>
    </Selcet> 
    </td>
    <td>
    ����:
    <Select name = "weekday">
       <Option value="����һ">����һ</Option>
       <Option value="���ڶ�">���ڶ�</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
    </Selcet>
    </td>
    <td>����ʱ���:
		  <select name="period">
		     <option value="һ����">һ����</option>
		     <option value="���Ľ�">���Ľ�</option>
		     <option value="������">������</option>
		     <option value="�߰˽�">�߰˽�</option>
		     <option value="��ʮ��">��ʮ��</option>
		  </select></td>
    <td>
    <INPUT type="submit" value="�鿴" name="submit">
    </td>
   </table>
  </FORM>
  
</CENTER>
</BODY>
<HTML>