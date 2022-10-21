package jdbc;

import java.sql.*;

public class DBWork {

    // PostreSQL baglantisi methodu

    public Connection connect_to_db(String dbName, String user, String password){

        Connection con = null;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+dbName,user,password);
            if (con != null){
                System.out.println("Baglanti saglandi");
            }
        } catch (Exception e) {
            System.out.println("Database baglantisi kurulamadi");
            System.out.println(e);
        }
        return con;
    }

    // Yeni Table olusturma methodu
    public void createTable(Connection con, String tableName, String... columnNamesDataType ) {

        Statement st;

        try {
            st = con.createStatement();
            String query = "CREATE TABLE " + tableName + " (id SERIAL, PRIMARY KEY(id))";
            st.executeUpdate(query);

            for (String each : columnNamesDataType
            ) {
                st.executeUpdate("ALTER TABLE " + tableName + " ADD " + each);
            }
        } catch (SQLException e) {
            System.out.println("Tablo olusturulamadi");
        }
    }

    // Table yazdirma methodu
    public void tableYazdir(Connection con, String tableName){
        Statement st;
        try {
            st = con.createStatement();
            String query = "SELECT * FROM " + tableName;
            ResultSet rs = st.executeQuery(query);
            while (rs.next()){
                System.out.println(rs.getInt(1) + " "
                        + rs.getString(2) + " " + rs.getString(3) + " " + rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println("Tablo yazdirilamadi");
        }
    }

    // Tabloya data ekleme
    public void dataEkle(Connection con, String tableName, String name, String adres, int tel){
        Statement st;
        try {
            st = con.createStatement();
            String query = "INSERT INTO " + tableName + " VALUES(default, '" + name + "', '" + adres + "', " + tel + ")";
            st.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("TabloYA data ekleme yapilamadi");
        }
    }
    }
