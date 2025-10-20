package utils;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author lumiere
 */
public class Koneksi {
    private final String mysqlUrl = "jdbc:mysql://localhost/aplikasipembelian?user=root&password=lumiere2327";
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
