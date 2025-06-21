<html>
    <head>
        <title>TODO supply a title</title>
    </head>
    <body>
        <center>
       <form method="post" action="login.jsp">     
      <table border="1">
          <tr><th>User Name</th><td><input type="text" name="txtuser"></td></tr>
          <tr><th>Password</th><td><input type="password" name="txtpass"></td></tr>
          <tr><th>DateBase Name</th><td><input type="text" name="txtdatabase"></td></tr>
          <tr><td></td>
              <td>
                  <input type="submit" value="Submit">
                  <input type="reset" value="Reset">
              </td></tr>
      </table> 
      <% 
       String user=null,pass=null,dname=null;
       user=request.getParameter("txtuser");
       pass=request.getParameter("txtpass");
       if(user!=null && pass!=null)
       {
           if(user.equals("root") && pass.equals("root"))
           {    
             dname=request.getParameter("txtdatabase");
             session.setAttribute("dname",dname);
             response.sendRedirect("sql.jsp");
           }
           else
              out.println("Invalid user name or password");
       }    
       
      %> 
     </center>       
    </body>
</html>
