use std::ffi::{CStr, CString};
use std::os::raw::c_char;

macro_rules! define_color_fn {
    ($name:ident, $code:literal) => {
        #[unsafe(no_mangle)]
        pub unsafe extern "C" fn $name(input: *const c_char) -> *mut c_char {
            let input = unsafe {
                CStr::from_ptr(input)
                    .to_string_lossy()
            };

            let result = format!("\x1b[{}m{}\x1b[0m", $code, input);

            CString::new(result)
                .expect("input contains an interior NUL")
                .into_raw()
        }
    };
}

define_color_fn!(rsColorRed, 31);
define_color_fn!(rsColorGreen, 32);
define_color_fn!(rsColorBlue, 34);
define_color_fn!(rsColorReset, 0);