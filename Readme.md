# 📱 Barqo

Barqo is a **Garmin Connect IQ watch app** that lets you carry your cards directly on your wrist.

Instead of digging through your wallet or phone, you can quickly display your cards as **barcodes** (with QR support coming soon) and scan them on the go.

---

## 🚀 Features

* 📇 Store multiple cards (loyalty, membership, etc.)
* 📊 Display cards as **barcodes** on your watch
* ⚡ Fast access directly from your wrist
* 🔄 Planned: sync with a mobile app
* 🔳 Planned: **QR code support**

---

## 🧱 Project Structure

```
Barqo/
├── watch-app/     # Garmin Connect IQ app
├── android-app/   # (planned) companion Android app
```

---

## ⌚ Watch App

The `watch-app` is built using the **Garmin Connect IQ SDK** and runs on supported Garmin devices.

### Requirements

* Garmin Connect IQ SDK
* Java (for monkeyc compiler)
* A supported Garmin device or simulator

### Build

Make sure you're inside the `watch-app` directory:

```bash
monkeyc -o bin/Barqo.prg -f monkey.jungle -y developer_key -d <device_id> -w
```

Or use the VS Code Connect IQ extension if installed.

---

## 📲 Android App (Planned)

The Android app will allow you to:

* Add and manage cards easily
* Sync cards to your watch
* Possibly scan/import barcodes using your phone camera

---

## 🛠️ Roadmap

* [x] Basic barcode display on watch
* [ ] QR code support
* [ ] Card management UI improvements
* [ ] Android companion app
* [ ] Sync between phone and watch
* [ ] Cloud backup (optional)

---

## 💡 Use Cases

* Loyalty cards (supermarkets, coffee shops)
* Gym memberships
* Event tickets
* Access passes

---

## 🔐 Security & Privacy

Barqo is designed to store only the data needed to render your cards.
Future versions may include optional syncing and backup features.

---

## 📄 License

Add your license here (e.g. MIT, Apache 2.0).

---

## 🙌 Contributing

Contributions, ideas, and feedback are welcome!

---

## 📷 Screenshots

*Add screenshots of the watch app here once available.*

---

## ✨ Name

**Barqo** = *Barcode on your wrist.*

---
