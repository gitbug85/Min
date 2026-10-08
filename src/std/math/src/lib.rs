use pyo3::prelude::*;
use pyo3::types::PyModule;

#[unsafe(no_mangle)]
pub extern "C" fn intAdd(module: &Bound<'_, PyModule>, a: i32, b: i32) -> i32 {
    module
        .getattr("intAdd")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}

#[unsafe(no_mangle)]
pub extern "C" fn intSub(module: &Bound<'_, PyModule>, a: i32, b: i32) -> i32 {
    module
        .getattr("intSub")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}

#[unsafe(no_mangle)]
pub extern "C" fn intDiv(module: &Bound<'_, PyModule>, a: i32, b: i32) -> i32 {
    module
        .getattr("intDiv")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}

#[unsafe(no_mangle)]
pub extern "C" fn intMult(module: &Bound<'_, PyModule>, a: i32, b: i32) -> i32 {
    module
        .getattr("intMult")
        .unwrap()
        .call1((a, b))
        .unwrap()
        .extract()
        .unwrap()
}
