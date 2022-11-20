<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Employee</title>
    </head>
    <body>
		<script type="text/javascript">
		function forward(control) {
			var param = control.value;
			if (param == null || param === '') {
				location.href='Thompson_Nicholas_IP_Task7_add_employee_form.jsp';
			} else {
				location.href='Thompson_Nicholas_IP_Task7_add_employee_form.jsp?type=' + param;
			}
		}
		</script>
		<%
			final String type = request.getParameter("type");
		%>
        <h2>Add Employee</h2>
        <!--
            Form for collecting user input for the new movie_night record.
            Upon form submission, add_movie.jsp file will be invoked.
        -->
        <form action="Thompson_Nicholas_IP_Task7_add_employee.jsp">
            <!-- The form organized in an HTML table for better clarity. -->
            <table border=1>
                <tr>
                    <th colspan="2">Enter the Employee Data:</th>
                </tr>
                <tr>
                    <td style='width: 10em'>Employee Type:</td>
                    <td><div style="text-align: center;">
                    <select name="type" id="type" onchange="forward(this)">
                    	<%
                    		//forward selection options as a paramter to affect form
                    		out.println("<option value='' " + (type == null || type.equals("") ? "selected" : "") + "></option>");
                    		out.println("<option value='1' " + (type != null && type.equals("1") ? "selected" : "") + ">Quality Controller</option>");
                    		out.println("<option value='2' " + (type != null && type.equals("2") ? "selected" : "") + ">Worker</option>");
                    		out.println("<option value='3' " + (type != null && type.equals("3") ? "selected" : "") + ">Technical Staff</option>");
                    	%>
                    </select>
                    </div></td>
                </tr>
                <tr>
                    <td>Employee Name:</td>
                    <td><div style="text-align: center;">
                    <input type=text name=name>
                    </div></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><div style="text-align: center;">
                    <input type=text name=address>
                    </div></td>
                </tr>
                <tr>
                    <td>Salary:</td>
                    <td><div style="text-align: center;">
                    <input type=text name=salary>
                    </div></td>
                </tr>
                <%
                	//if the current selected type i s quality controller
                	if (type != null && type.equals("1")) {
                		out.println("<tr>");
                		out.println("<td>Product Type:</td>");
                		out.println("<td><div style='text-align: center;'>");
                		out.println("<input type=text name=product_type>");
                		out.println("</div></td>");
                		out.println("</tr>");
                	} 
                	//if the current selected type is worker
                	else if (type != null && type.equals("2")) {
                		out.println("<tr>");
                		out.println("<td>Max Products Per Day:</td>");
                		out.println("<td><div style='text-align: center;'>");
                		out.println("<input type=text name=max_products_per_day>");
                		out.println("</div></td>");
                		out.println("</tr>");
                	} 
                	//if the current selected type is technical staff
                	else if (type != null && type.equals("3")) {
                		out.println("<tr>");
                		out.println("<td>Technical Position:</td>");
                		out.println("<td><div style='text-align: center;'>");
                		out.println("<input type=text name=technical_position>");
                		out.println("</div></td>");
                		out.println("</tr>");
                		
                		out.println("<tr>");
                		out.println("<td>Degrees:</td>");
                		out.println("<td><div style='text-align: center;'>");
                		out.println("<input type=text name=degrees>");
                		out.println("</div></td>");
                		out.println("</tr>");
                	}	
                %>
                <tr>
                    <td><div style="text-align: center;">
                    <input type=reset value=Clear>
                    </div></td>
                    <td><div style="text-align: center;">
                    <input type=submit value=Insert>
                    </div></td>
                </tr>
            </table>
        </form>
    </body>
</html>
