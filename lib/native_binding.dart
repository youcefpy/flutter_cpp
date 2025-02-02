import 'dart:ffi'; // Dart FFI
import 'dart:io'; // For Platform
import 'package:ffi/ffi.dart';

final DynamicLibrary nativeLib = DynamicLibrary.open(
  Platform.isAndroid ? "libhello.so" : "libhello.dylib",
);

typedef HelloFromCppFunc = Pointer<Utf8> Function();
typedef HelloFromCpp = Pointer<Utf8> Function();

// Get the function from native libraries
final HelloFromCpp helloWorld = nativeLib
    .lookup<NativeFunction<HelloFromCppFunc>>('helloFromCpp')
    .asFunction();

// Function to compute the sum
typedef SumFunctionCppFunc = Int32 Function(Int32, Int32);
typedef SumFunctionCpp = int Function(int, int);
final SumFunctionCpp sumFunction = nativeLib
    .lookup<NativeFunction<SumFunctionCppFunc>>('SumFunctionCpp')
    .asFunction();
