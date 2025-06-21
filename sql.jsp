<%@page  import="java.sql.*"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <center>
       <form>
           <h1>SQL Browser</h1>
           <textarea rows="8" cols="90" name="txtsql"></textarea>
           <br>
           <input type="submit" value="Execute">
       </form>    
          <% 
              String sql;
              sql=request.getParameter("txtsql");
              if(sql!=null)
              {
                 Connection con=null;
                 PreparedStatement ps=null;
                 ResultSet rs=null;
                 ResultSetMetaData rsmd=null;
                 Class.forName("com.mysql.jdbc.Driver");
                 String dbname;
                 dbname=session.getAttribute("dname").toString();
                 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname,"root","root");
                 ps=con.prepareStatement(sql);
                if(sql.toUpperCase().startsWith("SELECT")) 
                {
                    rs=ps.executeQuery();
                    rsmd=rs.getMetaData();
                    int i;
                    out.println("<table border=1>");
                    out.println("<tr>");   
                    for(i=1;i<=rsmd.getColumnCount();i++)
                    {
                      out.println("<th>"+rsmd.getColumnName(i)+"</th>");  
                    }
                    out.println("</tr>");
                    while(rs.next())
                   {
                       out.println("<tr>");
                       for(i=1;i<=rsmd.getColumnCount();i++)
                         {
                             out.println("<td>"+rs.getString(i)+"</td>");   
                         }    
                         out.println("</tr>");   
                    }
                    
                    out.println("</table>");
                        
                }    
                else
                {
                    int n;
                    n=ps.executeUpdate(sql);
                   out.println("<h4>Query OK," +n+ " row affected</h4>");
                }
              }
          %>  
         </center>   
    </body>
</html>
