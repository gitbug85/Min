// Code made by Google:
use magnus::{prelude::*, Error, Ruby, Value};

fn main() -> Result<(), Error> {
    magnus::Ruby::init(|ruby| {
        ruby.require("./math")?;

        let res: i64 = ruby.eval("self")?.funcall("my_ruby_method", (40, 2))?;
        println!("Result from funcall: {}", res);
        Ok(())
    })
    .unwrap()
}

