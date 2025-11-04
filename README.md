# 🛍️ Aplikasi Pembelian Barang

Aplikasi desktop berbasis **Java Swing** untuk mengelola data pembelian barang, suplier, dan laporan menggunakan **JasperReports**.  
Dikembangkan menggunakan **NetBeans**, **MySQL**, dan mendukung konfigurasi melalui **.env file** agar mudah dipindahkan antar lingkungan.

---

## 🚀 Fitur Utama
- CRUD Data Barang & Suplier  
- Cetak Laporan dengan JasperReports (`.jrxml` / `.jasper`)  
- Koneksi database via `.env`  
- UI berbasis Java Swing  
- Build otomatis menggunakan `Ant`

---

## 📂 Struktur Folder Penting

```tree
AplikasiPembelian/
├── nbproject/                  # Konfigurasi project milik NetBeans (otomatis dibuat IDE)
├── src/                        # Kode sumber utama (.java)
│   ├── components/       # Komponen utama aplikasi
│   ├── icons/            # Ikon (mis. .png, .ico)
│   ├── images/           # Gambar tambahan
│   └── utils/            # Utility/helper class
├── build/                # Hasil kompilasi (.class)
├── dist/                 # Hasil build akhir (JAR + libraries)
├── test/                 # Unit test (jika ada)
├── plugins/              # Plugin eksternal (jika digunakan)
├── build.xml             # File build otomatis (ant build script)
├── manifest.mf           # Metadata untuk JAR
├── .env.example          # Contoh konfigurasi environment
└── .env                  # File konfigurasi asli (disembunyikan dari git)

```

## ⚙️ Persiapan Awal

### 1️⃣ Persyaratan
Pastikan sudah terinstall:
- **Java JDK 25** 
- **NetBeans IDE** (disarankan versi 27)  
- **MySQL Server**  
- **Git** *(opsional)*  

> [!NOTE]
> >
> Jika kamu menggunakan versi Java dibawahnya maka anda harus mengganti versi java di projectnya

#### 🔧 Cara Ganti Versi Java (di nbproject/project.properties)

1. Buka file `nbproject/project.properties`

2. Cari baris yang mirip dengan ini:


    ```properties
    javac.source=25
    javac.target=25
    ```

3. Ganti angka 25 sesuai versi JDK yang kamu pakai. Misalnya kamu pakai Java 17, ubah jadi:

    ```properties
    javac.source=17
    javac.target=17
    ```

4. Simpan, lalu Clean and Build project kamu di NetBeans:


---

### 2️⃣ Setup Database
1. Jalankan MySQL dan buat database:
    ```sql
    CREATE DATABASE aplikasipembelian;
    ```
2. Import file MySQL:
    ```bash
    mysql -u root -p aplikasipembelian < mysql/aplikasipembelian.sql
    ```

### 3️⃣ Konfigurasi File .env

Buat file .env di folder `AplikasiPemelian` yang ada file `.env.example` (jika belum ada):

```env
DBURL=
DBNAME=
DBUSER=
DBPASSWORD=
```

### 4️⃣ Jalankan Aplikasi

- Buka project di NetBeans

- Pastikan semua .jar di env/, driver-jdbc-mysql/, dan jasperreport/ sudah ditambahkan ke Libraries

- Jalankan file utama `FormMenu.java`

## 🧩 Library Utama

| Nama Library              | Versi         | Lokasi                |
|---------------------------|---------------|-----------------------|
|MySQL Connector/J          | 9.4.0         | driver-jdbc-mysql/    |
|Java Dotenv                | 5.2.2         | env/                  |
|JasperReports              | 6.21.4        | jasperreport/         |
|Kotlin-stdlib              | 2.2.xx        | Kotlin-stdlib/        |
|spring                     | 3.xx RELEASE  | spring/               |
|Barbecue, Batik, POI, dll  |   -           | library-xml/dist/lib/ |

## 🖥️ Contoh Konfigurasi Koneksi

```java
import io.github.cdimascio.dotenv.Dotenv;

private static final Dotenv dotenv = Dotenv.load();
private static final String mysqlUrl = String.format(
    "%s%s?user=%s&password=%s",
    dotenv.get("DBURL"),
    dotenv.get("DBNAME"),
    dotenv.get("DBUSER"),
    dotenv.get("DBPASSWORD")
);

private Connection connect = DriverManager.getConnection(mysqlUrl);
```

