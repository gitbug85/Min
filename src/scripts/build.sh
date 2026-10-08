nim c ./src/min.nim
rustc --crate-type=staticlib ./src/std/math.rs -o ./src/std/math.a
rustc --crate-type=staticlib ./src/std/rsPath.rs -o ./src/std/rsPath.a
rustc --crate-type=staticlib ./src/std/string.rs -o ./src/std/string.a
rustc --crate-type=staticlib ./src/std/io.rs -o ./src/std/io.a
rustc --crate-type=staticlib ./src/std/ansiColors.rs -o ./src/std/ansiColors.a
cargo build --manifest-path ./src/std/math/Cargo.toml --release
