package jdbc;

import java.sql.Connection;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {

        DBWork db = new DBWork();
        Connection con = db.connect_to_db("Techproed","postgres","*****");

        db.createTable(con,"deneme","name VARCHAR(30)","adres VARCHAR(80)","tel INT");

        db.dataEkle(con, "deneme", "mami", "cdkjfhdsfjf", 45484644);

        db.tableYazdir(con,"deneme");
    }
}
