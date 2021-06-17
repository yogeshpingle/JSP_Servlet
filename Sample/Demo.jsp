<%@page import ="java.sql.*"%>
<html>
<head><title>MS Access</title></head>
<body>
<table border=1>
<tr><th>Student ID</th><th>Student Name</th></tr>
<%
Connection cn=null;
{

try
{
// Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
//String url = "jdbc:odbc:Driver={Microsoft Access Driver " + "(*.mdb, *.accdb)};DBQ=C:/apache-tomcat-9.0.39-windows-x64/apache-tomcat-9.0.39/webapps/SampleProject.accdb";
 //cn = DriverManager.getConnection(url);
String url="jdbc:ucanaccess:C:\\apache-tomcat-9.0.39-windows-x64\\apache-tomcat-9.0.39\\webapps\\SampleProject.accdb";

cn = DriverManager.getConnection(url);

//cn = DriverManager.getConnection("jdbc:ucanaccess://;memory=false");

Statement st=cn.createStatement();
ResultSet rs=st.executeQuery("select * from feedback2");//Table Name:student

while(rs.next())
{
%>
<tr>
<td><%=rs.getString("fname")%></td>
<td><%=rs.getString("lname")%></td>
</tr>
<%
}
rs.close();
st.close();
cn.close();
}
catch(Exception ex)
{
ex.printStackTrace();
}
}
%>
</table>
</body>
</html>