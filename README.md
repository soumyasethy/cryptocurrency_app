# Cryptocurrency App

![alt text](https://github.com/soumyasethy/cryptocurrency_app/blob/master/android.gif)
![alt text](https://github.com/soumyasethy/cryptocurrency_app/blob/master/ios.gif)

## How to Run

Change your current working directory to the project directory. That is the directory containing this README file
```
cd cryptocurrency_app
```
#### Get flutter dependencies
```
flutter pub get
```
#### Run
To run in debug mode run
```
flutter run
```
To run in release mode run (only for physical devices)
```
flutter run --release
```
## How to Install
You can also build an apk and install it on your phone
#### Generate an apk (build/app/outputs/apk/release/app-release.apk)
```
flutter build apk
```
#### Install the apk
```
adb install build/app/outputs/apk/release/app-release.apk
```

