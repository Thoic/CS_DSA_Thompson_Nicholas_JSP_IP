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
    Thompson_Nicholas_IP_Task7_DataHandler handler = new Thompson_Nicholas_IP_Task7_DataHandler();

    // Get the attribute values passed from the input form.
    final String typeString = request.getParameter("type");
    final String name = request.getParameter("name");
    final String address = request.getParameter("address");
    final String salaryString = request.getParameter("salary");
    final String product_type = request.getParameter("product_type");
    final String max_products_per_dayString = request.getParameter("max_products_per_day");
    final String technical_position = request.getParameter("technical_position");
    final String degrees = request.getParameter("degrees");

    /*
     * If the user hasn't filled out all the type, name, address and salary. This is very simple checking.
     */
    if (typeString.equals("") || name.equals("") || address.equals("") || salaryString.equals("") || //check attributes for employees
    		(typeString.equals("1") && product_type.equals("")) || //check attributes to quality controller
    		(typeString.equals("2") && max_products_per_dayString.equals("")) ||  //check attribues to worker
    		(typeString.equals("3") && (technical_position.equals("") || degrees.equals(""))) //check attributes technical staff
    		) {
        response.sendRedirect("Thompson_Nicholas_IP_Task7_add_employee_form.jsp");
    } else {
        int type = Integer.parseInt(typeString); //parse type as int
        float salary = Float.parseFloat(salaryString); //parse salary as float
        int max_products_per_day = type == 2 ? -1 : Integer.parseInt(max_products_per_dayString); //parse max products if type is worker
        
        // Now perform the query with the data from the form.
        boolean success = handler.addEmployee(type, name, address, salary, product_type, max_products_per_day, technical_position, degrees);
        if (!success) { // Something went wrong
            %>
                <h2>There was a problem inserting the employee</h2>
            <%
        } else { // Confirm success to the user
            %>
            <h2>The Employee:</h2>

            <ul>
                <li>Employee Type: <%=typeString%></li>
                <li>Employee Name: <%=name%></li>
                <li>Address: <%=address%></li>
                <li>Salary: <%=salaryString%></li>
                <li>Product Type: <%=product_type%></li>
                <li>Max Products Per Day: <%=max_products_per_dayString%></li>
                <li>Technical Position: <%=technical_position%></li>
                <li>Degrees: <%=degrees%></li>
            </ul>

            <h2>Was successfully inserted.</h2>
            
            <a href="Thompson_Nicholas_IP_Task7_get_employee_form.jsp">See all employees.</a>
            <%
        }
    }
    %>
    </body>
</html>
