nim c ./src/min.nim
rustc --crate-type=staticlib ./src/std/math.rs -o ./src/std/math.a
rustc --crate-type=staticlib ./src/std/rsPath.rs -o ./src/std/rsPath.a
rustc --crate-type=staticlib ./src/std/string.rs -o ./src/std/string.a
rustc --crate-type=staticlib ./src/std/io.rs -o ./src/std/io.a
crystal build ./src/std/ansiColors.cr --cross-compile -o ./src/std/ansiColors
ar -rcs ./src/std/ansiColors.a ./src/std/ansiColors.o