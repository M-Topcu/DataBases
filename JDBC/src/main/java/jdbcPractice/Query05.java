package jdbcPractice;

import java.sql.*;

public class Query05 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Techproed","postgres","*******");

        Statement st = con.createStatement();

        // SORU: ogrenciler tablosuna yeni kayit ekleyin. (300, 'Sena Can', 12, 'K')
        int s1 = st.executeUpdate("INSERT INTO ogrenciler VALUES (300, 'Sena Can', 12, 'K')");

        System.out.println(s1>=1 ? "Kayit eklendi" : "Kayit eklenemedi");

        // SORU: ogrenciler tablosuna birden fazla veri ekleyin
        // (301, 'Sena Can', 12, 'K'), (302, 'Sena Can', 12, 'K'), (303, 'Sena Can', 12, 'K')

        // 1. Yol

        String [] veri = {"(301, 'Sena Can', 12, 'K')", "(302, 'Sena Can', 12, 'K')", "(303, 'Sena Can', 12, 'K')"};
        String insert = "INSERT INTO ogrenciler VALUES ";
        int count = 0;

        for (String each: veri
             ) {
            count+= st.executeUpdate(insert + each);
        }
        System.out.println(count + " data eklendi");


        // 2. Yol
        String [] veri2 = {"(304, 'Sena Can', 12, 'K')", "(305, 'Sena Can', 12, 'K')", "(306, 'Sena Can', 12, 'K')"};

        for (String each: veri2
             ) {
            st.addBatch(insert + each); // verileri birlestiriyor
        }
        st.executeBatch(); // datalari tek seferde gonderiyor

        st.close();
        con.close();
    }
}
