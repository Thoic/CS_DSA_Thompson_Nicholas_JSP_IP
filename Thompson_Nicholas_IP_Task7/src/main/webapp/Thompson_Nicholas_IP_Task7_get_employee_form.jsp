<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Get Employees</title>
    </head>
    <body>
        <h2>Get Employees</h2>
        <!--
            Form for collecting user input for the new movie_night record.
            Upon form submission, add_movie.jsp file will be invoked.
        -->
        <form action="Thompson_Nicholas_IP_Task7_get_employee.jsp">
            <!-- The form organized in an HTML table for better clarity. -->
            <table border=1>
                <tr>
                    <th colspan="2">Enter the minimum salary of employees to return:</th>
                </tr>
                <tr>
                    <td>Salary:</td>
                    <td><div style="text-align: center;">
                    <input type=text name=salary>
                    </div></td>
                </tr>
                <tr>
                    <td><div style="text-align: center;">
                    <input type=reset value=Clear>
                    </div></td>
                    <td><div style="text-align: center;">
                    <input type=submit value=Get>
                    </div></td>
                </tr>
            </table>
        </form>
    </body>
</html>
