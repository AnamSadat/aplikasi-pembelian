package utils;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import io.github.cdimascio.dotenv.Dotenv;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author lumiere
 */
public class Koneksi {
     // muat .env sekali saja (static block biar nggak panggil berkali-kali)
    private static final Dotenv dotenv = Dotenv.load();

    // bikin variabel URL static final
    private static final String mysqlUrl = String.format(
        "%s%s?user=%s&password=%s",
        dotenv.get("DBURL"),
        dotenv.get("DBNAME"),
        dotenv.get("DBUSER"),
        dotenv.get("DBPASSWORD")
    );
    private Connection connect;
    
    public Connection buatKoneksi() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager.getConnection(mysqlUrl);
        }catch(ClassNotFoundException error){
            System.out.println("Driver MySQL JDBC tidak ditemukan!\n" + error);
        }catch(SQLException error) {
            System.out.println("Internal Server Error!\n" + error);
        }
        return connect;
    }
}
