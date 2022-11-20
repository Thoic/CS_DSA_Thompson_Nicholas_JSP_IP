package jsp_azure_test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Thompson_Nicholas_IP_Task7_DataHandler {

    private Connection conn;

    // Azure SQL connection credentials
    private String server = "thom0414-sql-server.database.windows.net";
    private String database = "cs-dsa-4513-sql-db";
    private String username = "thom0414";
    private String password = "IHateSql!!!";

    // Resulting connection string
    final private String url =
            String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;",
                    server, database, username, password);
    
    //query templates
    final static String QUERY_TEMPLATE_1 = "EXEC ip_query1 @type = ?, @name = ?, @address = ?, @salary = ?, @product_type = ?, @max_products_per_day = ?, @technical_position = ?, @degrees = ?";
    final static String QUERY_TEMPLATE_12 = "EXEC ip_query12 @salary = ?";

    // Initialize and save the database connection
    private void getDBConnection() throws SQLException {
        if (conn != null) {
            return;
        }

        this.conn = DriverManager.getConnection(url);
    }
    
    //Return the result of running query 12
    public ResultSet getSalaryEmployees(float salary) throws SQLException {
    	getDBConnection(); //prepare the database connection
    	
    	//prepare the sql statement
    	final PreparedStatement stmt = conn.prepareStatement(QUERY_TEMPLATE_12);
    	
    	//replace the ? in the statement with the given attribute values
    	stmt.setFloat(1, salary);
    	
    	return stmt.executeQuery();
    }
    
    //inserts a new employee per query 1
    public boolean addEmployee(
    		int type, String name, String address, float salary, String product_type, int max_products_per_day, String technical_position, String degrees) throws SQLException {
    	
    	getDBConnection();//prepare the database connection
    	
    	//prepare the sql statement
    	final PreparedStatement stmt = conn.prepareStatement(QUERY_TEMPLATE_1);
    	
    	// Replace the '?' in the above query template with the given attribute values
    	stmt.setInt(1, type);
    	stmt.setString(2, name);
    	stmt.setString(3, address);
    	stmt.setFloat(4, salary);
    	stmt.setString(5, product_type);
    	stmt.setInt(6, max_products_per_day);
    	stmt.setString(7, technical_position);
    	stmt.setString(8, degrees);
    	
    	return stmt.executeUpdate() == 1;
    }
}
