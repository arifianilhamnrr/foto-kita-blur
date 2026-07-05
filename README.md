# foto kita blur ~

Photobooth webcam berbasis gesture — blur pas ✌️, musik, lirik, strip foto, dan video. Terinspirasi [*foto kita blur*](https://genius.com/Sal-priadi-foto-kita-blur-lyrics) oleh Sal Priadi.

> Fork & pengembangan dari [claramiadevira/foto-kita-blur](https://github.com/claramiadevira/foto-kita-blur) (versi Python/OpenCV asli).

---

## Apa ini?

Aplikasi browser yang pakai **MediaPipe Hands** untuk mendeteksi tangan kamu:

| Gesture | Efek |
|---------|------|
| ✌️ **Peace sign** | Blur live + lirik *foto kita blur* |
| 🖐️ **Buka 5 jari** (tahan) | Countdown 3 detik → sesi photobooth otomatis |
| 📸 **Tombol snap** | Jepret manual (di luar sesi) |

Selama photobooth: musik jalan, lirik muncul satu-satu, **2 foto** dijepret pas sinkron lirik, lalu digabung jadi **1 strip** vertikal yang langsung terunduh. Sesi direkam jadi **video** (~15 detik) beserta audio.

---

## Fitur

- **Blur on-demand** — cuma aktif pas peace sign (video & strip ikut)
- **Slider blur** ✌️ (2–22) — atur sendiri, tersimpan di browser
- **5 tema strip** + mode **acak** — lavender, blush, film, midnight, mint
- **Modal picker** — pilih kamera & tema lewat UI, bukan dropdown
- **Strip photobooth** — 2 foto, frame dekoratif, tanggal & lirik di footer
- **Rekam video** — kamera + musik + thumbnail strip di pojok kanan
- **Ganti kamera** — webcam laptop, USB, atau iPhone (Iriun) lewat WiFi
- **Upload lagu** — ganti `audio/foto-kita-blur.mp3` lewat UI 📁
- **Versi Python** — `blur.py` untuk desktop (OpenCV + MediaPipe Tasks)

---

## Quick start

### Browser (disarankan)

```bash
git clone https://github.com/arifianilhamnrr/foto-kita-blur.git
cd foto-kita-blur
chmod +x serve.sh
./serve.sh
```

Buka **http://localhost:8767** → *Izinkan Kamera & Mulai*.

Port bisa diganti:

```bash
PORT=3000 ./serve.sh
```

### Dari HP (WiFi sama)

Setelah server jalan, buka di browser HP:

```
http://<IP-laptop>:8767
```

IP ditampilkan di terminal dan di layar start aplikasi.

### Python (desktop)

```bash
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
python blur.py
```

Model `hand_landmarker.task` diunduh otomatis saat pertama kali jalan. Tekan `ESC` untuk keluar.

Atau pakai skrip:

```bash
chmod +x run.sh
./run.sh
```

---

## Cara pakai photobooth

1. Pilih **tema** 🎨 dan **kamera** 📷 di toolbar bawah (kalau perlu).
2. Atur **kekuatan blur** ✌️ di slider.
3. **Buka 5 jari** ke kamera, tahan sampai countdown selesai.
4. Musik mulai — ikuti lirik di bawah layar.
5. Pas momen *foto kita blur*, foto ke-1 & ke-2 otomatis dijepret.
6. Mau blur di video/foto? Tunjuk **peace sign** pas momen itu.
7. Sesi selesai → strip `.jpg` terunduh + video muncul di galeri kanan.

**Cooldown:** setelah sesi, turunkan tangan dulu (~8 detik) sebelum bisa trigger lagi.

---

## Toolbar

| Tombol | Fungsi |
|--------|--------|
| 📷 | Pilih kamera |
| 🎨 | Pilih tema strip |
| ✌️ slider | Kekuatan blur |
| 🎵 | Musik on/off |
| 📁 | Upload file audio sendiri |
| 📸 | Snap manual (3…2…1) |

---

## Tema strip

| Tema | Nuansa |
|------|--------|
| 🎲 Acak | Beda tiap sesi |
| 💜 Lavender dream | Ungu lembut |
| 💗 Blush hour | Pink romantis |
| 🎞️ Film reel | Vintage krem |
| 🌙 Midnight blur | Gelap ungu |
| 🍃 Soft mint | Hijau segar |

---

## Struktur project

```
foto-kita-blur/
├── index.html          # App browser (photobooth utama)
├── audio/
│   └── foto-kita-blur.mp3
├── vendor/             # MediaPipe Hands (WASM)
├── scripts/
│   └── fetch-vendor.sh
├── serve.sh            # HTTP server port 8767
├── blur.py             # Versi Python/desktop
├── run.sh
└── requirements.txt
```

Kalau `vendor/` belum ada:

```bash
chmod +x scripts/fetch-vendor.sh
./scripts/fetch-vendor.sh
```

---

## Tech stack

| Layer | Stack |
|-------|-------|
| Browser | MediaPipe Hands (WASM), Canvas, Web Audio, MediaRecorder |
| Python | OpenCV, MediaPipe Tasks API, NumPy |

---

## Credits

- **Konsep asli peace-blur:** [Clara Miadevira](https://github.com/claramiadevira/foto-kita-blur) · [@claratwork](https://instagram.com/claratwork)
- **Lagu:** [Sal Priadi – *foto kita blur*](https://genius.com/Sal-priadi-foto-kita-blur-lyrics)
- **Fork & photobooth browser:** [arifianilhamnrr](https://github.com/arifianilhamnrr)

---

## License

Mengikuti repo upstream asli. Gunakan untuk pembelajaran & fun — hormati hak cipta lagu saat distribusi publik.