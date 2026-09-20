use std::ffi::CStr;
use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn rsAdd(a: i32, b: i32) -> i32 {
    a + b
}

#[no_mangle]
pub extern "C" fn rsSub(a: i32, b: i32) -> i32 {
    a - b
}

#[no_mangle]
pub extern "C" fn rsMult(a: i32, b: i32) -> i32 {
    a * b
}

#[no_mangle]
pub extern "C" fn rsIntDiv(a: i32, b: i32) -> i32 {
    a / b
}

#[no_mangle]
pub extern "C" fn rsStrToi32(s: *const c_char) -> i32 {
    if s.is_null() {
        return 0;
    }

    let s = unsafe { CStr::from_ptr(s) };

    match s.to_str().ok().and_then(|s| s.parse::<i32>().ok()) {
        Some(value) => value,
        None => 0,
    }
}
