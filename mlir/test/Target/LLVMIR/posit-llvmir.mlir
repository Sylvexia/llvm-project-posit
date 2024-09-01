// RUN: mlir-translate -mlir-to-llvmir -split-input-file %s | FileCheck %s

// CHECK: @posit8es0_global_as_i8 = internal global i8 62
llvm.mlir.global internal @posit8es0_global_as_i8(1.5 : posit8es0) : i8