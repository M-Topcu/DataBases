package jdbc;

import java.sql.*;

public class CollableStatement01 {
    /*
    Javada return olsun olmasin method methoddur. Ancak SQL`de data return ediyorsa "FUNCTION"
    return yapmiyorsa "PROCEDURE" diye adlandirilir
     */
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");

        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Techproed","postgres","********");

        Statement st = con.createStatement();

        // 1. Ornek: 2 parametre ile calisip bu parametreleri toplayarak donus yapan bir function olusturun

        // 1. Adim: Fonksiyonu yaz
        String sql1 = "CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)\n" +
                "RETURNS NUMERIC\n" +
                "LANGUAGE plpgsql\n" +
                "AS\n" +
                "$$\n" +
                "BEGIN\n" +
                "\n" +
                "RETURN x+y;\n" +
                "END\n" +
                "$$";

        // 2. Adim: Fonksiyonu calistir
        st.execute(sql1);

        // 3. Adim: Fonksiyonu cagir
        CallableStatement cst1 = con.prepareCall("{? = call toplamaF(?, ?)}");

        // 4. Adim: Return icin registerOutParameter() methodunu, parametreler icin set.. methodlarini kullan
        cst1.registerOutParameter(1,Types.NUMERIC);
        cst1.setInt(2,15);
        cst1.setInt(3,25);

        // 5. Adim: Calistir
        cst1.execute();

        // 6. Adim: Sonucu cagirmak icin return data tipine gore get methodlarindan uygun olani kullan
        System.out.println(cst1.getBigDecimal(1));


        // 2. Ornek: Koninin hacmini hesaplayan bir function yazin

        String sql2 = "CREATE OR REPLACE FUNCTION koniHacim(r NUMERIC, h NUMERIC)\n" +
                "RETURNS NUMERIC\n" +
                "LANGUAGE plpgsql\n" +
                "AS\n" +
                "$$\n" +
                "BEGIN\n" +
                "RETURN r*r*3.14*h/3;\n" +
                "END\n" +
                "$$";

        st.execute(sql2);

        CallableStatement cst2 = con.prepareCall("{? = call koniHacim(?, ?)}");

        cst2.registerOutParameter(1, Types.NUMERIC);
        cst2.setInt(2, 10);
        cst2.setInt(3, 3);
        cst2.execute();

        System.out.println(cst2.getBigDecimal(1));
    }
}
