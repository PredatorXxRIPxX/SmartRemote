# 🌿 Smart Plant Irrigation System 🚿

A Flutter application that lets you be the perfect plant parent! 🪴 Control your irrigation system right from your phone via Bluetooth. Never forget to water your plants again! 🎯

## ✨ What's Cool About This App?

- 🎮 Control your watering system with just a tap
- 🤖 Smart automatic watering schedules
- 📱 Connect via Bluetooth seamlessly
- 💧 Know exactly when your plants need water
- 📊 Track your plant's happiness with stats
- 🔔 Get notified when your plants need attention
- 🌡️ Monitor soil moisture levels
- 📅 Set & forget scheduling system
- 🎯 Precision watering control

## 🛠️ What You'll Need

### 📱 Software Requirements
- 💻 Flutter SDK (3.0.0+)
- 🎯 Dart (2.17.0+)
- 🔧 Android Studio or VS Code
- 📱 Android SDK (for Android builds)
- 🍎 Xcode (for iOS builds)
- 🔵 Bluetooth-enabled test device

### 🔧 Hardware Shopping List
- 🤖 Arduino controller
- 📡 Bluetooth module (HC-05)
- 🚰 Water valves
- 💧 Water pump
- 📏 Water level sensor
- 🌱 Soil moisture sensors
- ⚡ Power supply unit

## 🚀 Getting Started

### 📥 Installation Steps

1. 📋 Clone the repo:
```bash
git clone https://github.com/yourusername/smart-plant-irrigation.git
```

2. 📂 Jump into the project:
```bash
cd smart-plant-irrigation
```

3. 📦 Get the packages:
```bash
flutter pub get
```

4. 🎯 Launch it:
```bash
flutter run
```

## ⚙️ Setting Things Up

### 🤖 For Android
Add these to your Manifest:
```xml
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

### 🍎 For iOS
Pop this in Info.plist:
```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Need Bluetooth permission for connecting to irrigation system</string>
```

## 🎮 How to Use

1. 🔌 Power up your irrigation controller
2. 📱 Open the app
3. 🔵 Turn on Bluetooth
4. 🔍 Find and connect to your controller
5. ⏰ Set up your watering schedules
6. 📊 Watch your garden thrive!

## 🤝 Want to Help?

1. 🍴 Fork it
2. 🌿 Create your branch (`git checkout -b feature/awesome-idea`)
3. 💾 Commit (`git commit -m '✨ Add awesome feature'`)
4. 🚀 Push it (`git push origin feature/awesome-idea`)
5. 🎯 Open a Pull Request

## 📝 Bluetooth Commands

- 🟢 Start Watering: "IRR:START"
- 🔴 Stop Watering: "IRR:STOP"
- ⏰ Set Schedule: "SCH:HH:MM:DD"
- ❓ Get Status: "STATUS"
- ⏱️ Set Duration: "DUR:MINUTES"

## 🆘 Troubleshooting

### 🚨 Common Problems & Fixes

1. 🔵 Bluetooth Won't Connect?
   - ✅ Is Bluetooth turned on?
   - 📱 Is your device nearby?
   - 🔌 Is the controller powered up?

2. 💧 Water Not Flowing?
   - ✅ Check water level
   - 🔧 Check valve connections
   - ⚡ Check power supply

3. 📱 App Acting Weird?
   - 🔄 Try restarting
   - 🗑️ Clear the cache
   - 📥 Reinstall if needed

## 📜 License

This project is under the MIT License - check out [LICENSE.md](LICENSE.md) 📄

## 👏 Special Thanks

- 🙌 Flutter community
- 🤖 Arduino enthusiasts
- 👥 All our contributors

## 📞 Need Help?

- 📧 Email us: [your-email@example.com]
- 💬 Open an issue
- 🌟 Star the repo if you like it!

## 🔜 Coming Soon

- 🌍 Multi-language support
- 🌈 More themes
- 🎨 Custom plant profiles
- 📊 Advanced analytics

Remember to give your plants some love! 🌿💚

---
Made with 💚 by plant lovers, for plant lovers 🌱
