import 'dart:ffi'; // Dart FFI
import 'dart:io'; // For Platform
import 'package:ffi/ffi.dart';

final DynamicLibrary nativeLib = DynamicLibrary.open(
  Platform.isAndroid ? "libhello.so" : "libhello.dylib",
);

typedef HelloFromCppFunc = Pointer<Utf8> Function();
typedef HelloFromCpp = Pointer<Utf8> Function();

// Get the function from the native library
final HelloFromCpp helloWorld = nativeLib
    .lookup<NativeFunction<HelloFromCppFunc>>('helloFromCpp')
    .asFunction();
