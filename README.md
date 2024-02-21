# noir-assertions-order-repro

Assertions are executed in wrong order.
This repo has a simple program that has two failing assertions and the second one is given as the reason. It will be more obvious to report the first one as the reason.

```rust
fn main() {
    assert(0 == 1, "First");
    assert(1 == 2, "Second");
}

#[test(should_fail_with = "First")]
fn test_main() {
    main();
}

```

Repro steps:
* nargo test

Results:
```
[assertions_order] Running 1 test function
[assertions_order] Testing test_main... FAIL

error: Test failed with the wrong message.
Expected: First
Got: Second

error: Assertion failed: 'Second'
  ┌─ noir-assertions-order-repro/src/main.nr:3:12
  │
3 │     assert(1 == 2, "Second");
  │            ------
  │
  = Call stack:
    1. noir-assertions-order-repro/src/main.nr:8:5
    2. noir-assertions-order-repro/src/main.nr:3:12

[assertions_order] 1 test failed
``` 