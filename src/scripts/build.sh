nim c ./src/min.nim
rustc --crate-type=staticlib ./src/std/math.rs -o ./src/std/math.a
rustc --crate-type=staticlib ./src/std/rustPath.rs -o ./src/std/rustPath.a
rustc --crate-type=staticlib ./src/std/string.rs -o ./src/std/string.a
rustc --crate-type=staticlib ./src/std/io.rs -o ./src/std/io.a
nim c --app:staticlib --noMain:on --mm:arc --panics:on -d:danger --header ./src/std/nimPath.nim
nim c --app:staticlib --noMain:on --mm:arc --panics:on -d:danger --header ./src/std/nimEcho.nim
