package jdbcPractice;

import java.sql.*;
public class Query01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Techproed","postgres","*********");

        Statement st = con.createStatement();

        ResultSet veri = st.executeQuery("select * from ogrenciler");

        while (veri.next()) {
            System.out.println(veri.getInt(1) + " " +
                    veri.getString(2) + " " + veri.getString(3) + " " + veri.getString(4));
        }

        st.close();
        con.close();
        veri.close();
    }
}
