# foto kita blur ~

Peace-sign blur + photobooth browser app, inspired by [Sal Priadi – *foto kita blur*](https://genius.com/Sal-priadi-foto-kita-blur-lyrics).

Fork & extended from [claramiadevira/foto-kita-blur](https://github.com/claramiadevira/foto-kita-blur) (Python/OpenCV original).

## Features

- **✌️ Peace sign** → live blur + lirik
- **🖐️ Buka 5 jari** → countdown → musik + photobooth otomatis
- **2 jepret** sinkron lirik, digabung jadi **1 strip** photobooth
- **Rekam video** sesi (~15 detik) + audio musik
- **5 tema strip** (atau acak) — pilih lewat modal UI
- **Blur manual** — slider ✌️, cuma aktif pas peace sign
- Pilih kamera (termasuk iPhone/Iriun via WiFi)
- Versi **Python/desktop** tetap ada (`blur.py`)

## Quick start (browser)

```bash
git clone https://github.com/arifianilhamnrr/foto-kita-blur.git
cd foto-kita-blur
chmod +x serve.sh
./serve.sh
```

Buka `http://localhost:8767` (atau IP laptop dari HP di WiFi yang sama).

### Musik

Taruh clip lagu di `audio/foto-kita-blur.mp3` (atau upload lewat UI 📁).

## Python version

```bash
pip install -r requirements.txt
python blur.py
```

Model `hand_landmarker.task` diunduh otomatis saat pertama jalan.

## Tech

- Browser: MediaPipe Hands (WASM), Canvas, MediaRecorder
- Python: OpenCV, MediaPipe Tasks API

## Credits

- Original peace-blur concept: [Clara Miadevira](https://github.com/claramiadevira/foto-kita-blur)
- Lagu: Sal Priadi – *foto kita blur*