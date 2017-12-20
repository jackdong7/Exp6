package myPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import com.mysql.jdbc.Driver;
public class Bean {
    public Bean()
    {
    }
    public ResultSet getRS(String sql)
    {
        try{
            String driverName="com.mysql.jdbc.Driver";
            String userName="root";
            String userPassword="895772";
            String dbName="teamwork";
            String url="jdbc:mysql://106.15.94.218/"+dbName+"?user="+userName+"&password="+userPassword;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn= DriverManager.getConnection(url);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            return rs;
        }
        catch(Exception e)
        {
            return null;
        }
    }
    public   Statement getRS_update()
    {
        try{
            String driverName="com.mysql.jdbc.Driver";
            String userName="root";
            String userPassword="895772";
            String dbName="design";
            String tableName="class_info";
            String url="jdbc:mysql://106.15.94.218/"+dbName+"?user="+userName+"&password="+userPassword;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url,userName,userPassword);
            Statement stmt = conn.createStatement();
            return stmt;

        }
        catch(Exception e)
        {
            return null;
        }

    }
}

