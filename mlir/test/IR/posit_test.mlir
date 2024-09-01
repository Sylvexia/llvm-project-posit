// RUN: mlir-opt %s -split-input-file -allow-unregistered-dialect -verify-diagnostics | FileCheck %s

func.func @float_attrs_pass() {
  "test.float_attrs"() {
    // CHECK: float_attr = 2.000000e+00 : posit8es0
    float_attr = 2. : posit8es0
  } : () -> ()
  "test.float_attrs"() {
    // CHECK: float_attr = 2.000000e+00 : posit16es1
    float_attr = 2. : posit16es1
  } : () -> ()
  return
}

// HEX: dense<"0x000020410000A040"> : tensor<2xposit8es0>
"test.op"() {dense.attr = dense<[10.0, 5.0]> : tensor<2xposit8es0>} : () -> ()