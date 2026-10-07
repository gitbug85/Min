use pyo3::prelude::*;
use pyo3::types::PyModule;

#[unsafe(no_mangle)]
pub extern "C" fn int_add(
    module: &Bound<'_, PyModule>,
    a: i32,
    b: i32,
) -> i32 {
    module
        .getattr("intAdd")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}

#[unsafe(no_mangle)]
pub extern "C" fn int_sub(
    module: &Bound<'_, PyModule>,
    a: i32,
    b: i32,
) -> i32 {
    module
        .getattr("intSub")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}

#[unsafe(no_mangle)]
pub extern "C" fn int_div(
    module: &Bound<'_, PyModule>,
    a: i32,
    b: i32,
) -> i32 {
    module
        .getattr("intDiv")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}

#[unsafe(no_mangle)]
pub extern "C" fn int_mult(
    module: &Bound<'_, PyModule>,
    a: i32,
    b: i32,
) -> i32 {
    module
        .getattr("intMult")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}