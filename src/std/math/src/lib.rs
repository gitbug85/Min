use std::process::Command;
use std::path::Path;

fn run_python(operation: &str, a: i32, b: i32) -> i32 {
    let script_path = Path::new(file!())
        .parent()
        .unwrap()
        .join("std/math/src/math.py");

    let output = Command::new("python3")
        .arg(script_path)
        .arg(operation)
        .arg(a.to_string())
        .arg(b.to_string())
        .output()
        .expect("Failed to run python3");

    if !output.status.success() {
        eprintln!("{}", String::from_utf8_lossy(&output.stderr));
        return 0;
    }

    String::from_utf8_lossy(&output.stdout)
        .trim()
        .parse()
        .expect("Python script did not return a valid integer")
}

#[unsafe(no_mangle)]
pub extern "C" fn intAdd(a: i32, b: i32) -> i32 {
    run_python("intAdd", a, b)
}

#[unsafe(no_mangle)]
pub extern "C" fn intSub(a: i32, b: i32) -> i32 {
    run_python("intSub", a, b)
}

#[unsafe(no_mangle)]
pub extern "C" fn intDiv(a: i32, b: i32) -> i32 {
    run_python("intDiv", a, b)
}

#[unsafe(no_mangle)]
pub extern "C" fn intMult(a: i32, b: i32) -> i32 {
    run_python("intMult", a, b)
}