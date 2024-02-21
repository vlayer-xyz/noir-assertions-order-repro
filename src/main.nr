fn main() {
    assert(0 == 1, "First");
    assert(1 == 2, "Second");
}

#[test(should_fail_with = "First")]
fn test_main() {
    main();
}
