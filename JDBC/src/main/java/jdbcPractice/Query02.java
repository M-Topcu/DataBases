package jdbcPractice;

import jdbc.DBWork;

import java.sql.*;

public class Query02 {
    public static void main(String[] args) throws SQLException {

        DBWork db = new DBWork();
        Connection con = db.connect_to_db("Techproed","postgres","*******");

        Statement st = con.createStatement();

        // Ogrenciler tablosundaki erkek ogrencileri listeleyiniz

        ResultSet data = st.executeQuery("SELECT * FROM ogrenciler WHERE cinsiyet = 'E'");
        while (data.next()) {
            System.out.println(data.getInt(1) + " " +
                    data.getString(2) + " " + data.getString(3) + " " + data.getString(4));
        }

        data.close();
        con.close();
        st.close();
    }
}
