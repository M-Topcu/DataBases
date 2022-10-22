package jdbcPractice;

import jdbc.DBWork;

import java.sql.*;

public class Query03 {
    public static void main(String[] args) throws SQLException {

        DBWork db = new DBWork();
        Connection conn = db.connect_to_db("Techproed","postgres","*****");

        Statement st = conn.createStatement();

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM ogrenciler");

        ResultSet rs = ps.executeQuery();

        ResultSetMetaData rsmd = rs.getMetaData();

        System.out.println("Tablo ismi: " + rsmd.getTableName(1));

        System.out.println("Sutun sayisi: " + rsmd.getColumnCount());

        System.out.println("1. Sutun ismi: " + rsmd.getColumnName(1));
        System.out.println("2. Sutun ismi: " + rsmd.getColumnName(2));
        System.out.println("3. Sutun ismi: " + rsmd.getColumnName(3));
        System.out.println("4. Sutun ismi: " + rsmd.getColumnName(4));

        System.out.println("1. Sutunun data tipi: " + rsmd.getColumnTypeName(1));
        System.out.println("2. Sutunun data tipi: " + rsmd.getColumnTypeName(2));
        System.out.println("3. Sutunun data tipi: " + rsmd.getColumnTypeName(3));
        System.out.println("4. Sutunun data tipi: " + rsmd.getColumnTypeName(4));

    }
}
