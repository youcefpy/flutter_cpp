# flutter_cpp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## Run this command in flutter-cpp/native  folder
```bash 
 cmake -G "Ninja" -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_NDK="C:/Users/t480/AppData/Local/Android/Sdk/ndk/25.1.8937393" -DCMAKE_SYSTEM_VERSION=21 -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a 
-DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="C:/ninja/ninja.exe" -B build
```
after runing this command and CMake detect the NDK , Clang compiler, and Ninja build system correctly.
Run this command  ```bash ninja ``` inside the build folder for generating the libhello.so file.

## Integrate libhello.so into Flutter
- Move the .so file to Flutter's JNI directory
Run the following command to create the directory:
```bash mkdir -p android/app/src/main/jniLibs/arm64-v8a ```


# Integrate libhello.so into Flutter
## Move the .so file to Flutter's JNI directory

run the following command : 

```bash mkdir -p android/app/src/main/jniLibs/arm64-v8a ```

Then, move the .so file there: ```bash mv build/libhello.so android/app/src/main/jniLibs/arm64-v8a/ ```


##  Update the android/app/build.gradle file

Open ``` android/app/build.gradle ``` and add the following under ```android```:

```
android {
    sourceSets {
        main {
            jniLibs.srcDirs = ['src/main/jniLibs']
        }
    }
}

```

##  Use dart:ffi in Flutter

Now, create a Dart file (native_binding.dart) and load the shared library in the lib folder.

