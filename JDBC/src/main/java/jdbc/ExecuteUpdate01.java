package jdbc;

import java.sql.*;

public class ExecuteUpdate01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Techproed","postgres","********");

        Statement st = con.createStatement();

        // 1. Örnek: number_of_employees degeri ortalamadan az olan number_of_employees degerlerini 16000 olarak update edin

        String sql1 = "UPDATE companies\n" +
                "SET number_of_employees = 16000\n" +
                "WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies)";

        System.out.println(st.executeUpdate(sql1)); // update edilen satir sayisini return eder

        st.close();
        con.close();

    }
}
