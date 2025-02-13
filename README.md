## CMake

we use it to generate build files for Android.

## Ninja
compile C++ code faster compared to traditional tools like Make.

## installing ninja  
- [click hire ](https://github.com/ninja-build/ninja/releases)
- install ninja-wind.zip


## Run this command in flutter-cpp/native  folder
```bash 
 cmake -G "Ninja" -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_NDK="path/to/Android/Sdk/ndk/25.1.8937393" -DCMAKE_SYSTEM_VERSION=21 -DCMAKE_ANDROID_ARCH_ABI=x86_64  
-DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="C:/ninja/ninja.exe" -B build
```
after runing this command and CMake detect the NDK , Clang compiler, and Ninja build system correctly.
Run this command  ``` ninja ``` inside the build folder for generating the libhello.so file.


## Using make instead of ninja 
take this command in terminal : 
```bash 
cmake -G "Unix Makefiles" -DCMAKE_SYSTEM_NAME=Android \
-DCMAKE_ANDROID_NDK="path/to/Android/Sdk/ndk/25.1.8937393" \
-DCMAKE_SYSTEM_VERSION=21 -DCMAKE_ANDROID_ARCH_ABI=x86_64 \
-DCMAKE_BUILD_TYPE=Release -B build

```
Run Make After generating the build files, go inside the build/ directory:
```bash
cd build
make
```


## Integrate libhello.so into Flutter
- Move the .so file to Flutter's JNI directory
Run the following command to create the directory:
``` mkdir -p android/app/src/main/jniLibs/x86_64 ```
copy the .so file from the native/build to android/app/src/main/jniLibs/x86_64


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

