use magnus::{Error, Ruby, Value, prelude::*};
use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn call(s: *const c_char) -> i64 {
    let method = unsafe {
        match CStr::from_ptr(s).to_str() {
            Ok(s) => s,
            Err(_) => return -1,
        }
    };

    // Try putting it into it's own function because it says it expects a function not a closure. I don't think this wil effect it though.
    let mut result = magnus::Ruby::init(|ruby| -> Result<(), Error> {
        ruby.require("./math")?;

        let receiver = ruby.eval("self")?;
        result = receiver.funcall(method, (40, 2))?;

        Ok(())
    })?;

    match result {
        Ok(value) => value,
        Err(err) => {
            eprintln!("Ruby error: {err}");
            -1
        }
    }
}
