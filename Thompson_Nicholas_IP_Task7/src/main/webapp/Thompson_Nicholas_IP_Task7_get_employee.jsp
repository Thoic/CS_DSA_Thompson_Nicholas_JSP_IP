<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query Result</title>
</head>
    <body>
    <%@page import="jsp_azure_test.Thompson_Nicholas_IP_Task7_DataHandler"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Array"%>
    <%
    // The handler is the one in charge of establishing the connection.
    final Thompson_Nicholas_IP_Task7_DataHandler handler = new Thompson_Nicholas_IP_Task7_DataHandler();

    // Get the attribute values passed from the input form.
    String salaryString = request.getParameter("salary");

    /*
     * If the user hasn't filled out salary. This is very simple checking.
     */
    if (salaryString.equals("")) {
        response.sendRedirect("Thompson_Nicholas_IP_Task7_get_employee_form.jsp");
    } else {
        float salary = Float.parseFloat(salaryString);
        
        // Now perform the query with the data from the form.
        final ResultSet employees = handler.getSalaryEmployees(salary);
        %>
        <!-- The table for displaying all the movie records -->
        <table cellspacing="2" cellpadding="2" border="1">
            <tr> <!-- The table headers row -->
              <td align="center">
                <h4>Employee Name</h4>
              </td>
            </tr>
            <%
	            while(employees.next()) { // For each employee record returned...
	                // Extract the attribute values for every row returned
	                final String name = employees.getString("name");
	                
	                out.println("<tr>"); // Start printing out the new table row
	                out.println( // Print each attribute value
	                     "<td align=\"center\">" + name + "</td>");

	                out.println("</tr>");
	            }
            %>
            
		</table>
	    <a href="Thompson_Nicholas_IP_Task7_get_employee_form.jsp">Enter a new minimum salary to display.</a>
	    <%
    }
    %>
    </body>
</html>
