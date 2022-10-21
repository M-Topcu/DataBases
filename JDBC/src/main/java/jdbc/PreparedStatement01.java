package jdbc;

import java.sql.*;

public class PreparedStatement01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Techproed","postgres","********");

        Statement st = con.createStatement();

        // 1. Ornek: Prepared Statement kullanarak company adi IBM olan number_of_employees degerini 9999 olarak guncelleyin

        // 1. Adim: Prepared Statement Query`sini olustur

        String sql1 = "UPDATE companies SET number_of_employees = ? WHERE company = ?";

        // 2. Adim: PreparedStatement objesini olustur

        PreparedStatement pst1 = con.prepareStatement(sql1);

        // 3. Adim: set...() methodlari ile ? yerine deger gir

        pst1.setInt(1, 9999);
        pst1.setString(2,"IBM");
        System.out.println(pst1.executeUpdate()); // 1 == bu kadar satir guncellendi

        String sql2 = "SELECT * FROM companies";

        ResultSet result1 = st.executeQuery(sql2);

        while (result1.next()) {
            System.out.println(result1.getInt(1) + " " + result1.getString(2) + " " + result1.getInt(3));
        }

        // 2. Ornek: "SELECT * FROM <table name>" Query`sini prepared statement ile kullanin

        String sql3 = "SELECT * FROM ?";

        ResultSet result2 = st.executeQuery(sql3.replace("?", "companies"));

        while (result2.next()) {
            System.out.println(result2.getInt(1) + " " + result2.getString(2) + " " + result2.getInt(3));
        }

        st.close();
        con.close();
    }
}
