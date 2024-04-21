// RUN: %target-typecheck-verify-swift
do {
  let s = [(Int, Int)]()
  for var (z, (j, (_, x2))) in s.enumerated().enumerated() {
    // expected-warning@-1 {{variable 'x2' was written to, but never read}} {{7-11=}} {{23-25=var x2}} {{27-28=)}}
    // expected-warning@-2 {{variable 'z' was never mutated; consider removing 'var' to make it constant}}
    // expected-warning@-3 {{variable 'j' was never mutated; consider removing 'var' to make it constant}}
    print(z)
    _ = j
    x2 = j
  }
  var foo = "S" // expected-warning {{variable 'foo' was never mutated; consider changing to 'let' constant}}
  print(foo)
}

do {
  let s = [Int]()
  for var (idx, elt) in s.enumerated() {
    // expected-warning@-1 {{variable 'elt' was never mutated; consider removing 'var' to make it constant}} {{7-11=}} {{12-15=var idx}} {{20-21=)}}
    idx = elt
    print(idx)
  }
}
