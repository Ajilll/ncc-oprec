### 1. Deskripsi Singkat Service
Service dibuat menggunakan bahasa pemrograman Python dengan framework FastAPI. FastAPI dipilih karena sangat ringan, modern, dan cepat. Service ini diatur menggunakan environment variable untuk menamai aplikasi secara dinamis.

### 2. Penjelasan Endpoint /health
Endpoint merespons request HTTP GET di path /health. Jika berhasil diakses, endpoint mengembalikan HTTP Status Code 200 OK dengan body response berformat JSON yang berisi detail status "sukses" dan pesan konfirmasi bahwa service berjalan dengan baik.

### 3. Screenshot Bukti Endpoint
<img width="814" height="209" alt="{A7AFAB74-ABFF-4411-9727-70C57A270426}" src="https://github.com/user-attachments/assets/6a922cb3-c559-4c9a-9cb6-e50ef6279ef5" />
<img width="802" height="207" alt="{FE44526E-1E26-4A77-84A3-E8E6808034AC}" src="https://github.com/user-attachments/assets/6a4ad013-64fc-491b-b5c2-88a5285097d1" />


### 4. Penjelasan Proses Build dan Run Docker
Build: Pembuatan image Docker menggunakan teknik Multi-stage build dengan base image python:3.11-alpine untuk sangat menekan ukuran image akhir. Telah diimplementasikan juga .dockerignore untuk mencegah build context yang tidak perlu masuk. Di dalam Dockerfile juga telah disematkan instruksi HEALTHCHECK.
Run: Menjalankan container menggunakan Docker Compose (docker-compose.yml) yang mengatur port mapping (8000:8000), konfigurasi .env, serta restart policy unless-stopped.

### 5. Penjelasan Proses Deployment ke VPS
Service telah berhasil di-dockerisasi secara lokal dan kode sumber telah di-push ke GitHub repository. Namun, karena keterbatasan akses kartu kredit/debit untuk verifikasi layanan Cloud/VPS gratis (seperti AWS/Google Cloud) dalam waktu yang sangat singkat, saya mengambil inisiatif melakukan simulasi public deployment menggunakan Ngrok Tunneling. Ngrok mem-forward port 8000 dari container Docker lokal saya ke public endpoint secara aman, sehingga URL /health tetap dapat diakses publik melalui internet sesuai syarat penugasan. Service di lokal akan terus menyala selama masa penilaian.

### 6. Kendala yang Dihadapi
Terkendala requirement kartu kredit pada mayoritas penyedia Free Tier Cloud Hosting/VPS saat mencoba melakukan deployment, yang akhirnya diselesaikan dengan problem-solving menggunakan metode tunneling Ngrok.
