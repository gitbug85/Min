macro define_color_fn(name, code)
  fun {{name.id}}(input : UInt8*) : UInt8*
    crystal_str = String.new(input)
    result = "\e[{{code}}m#{crystal_str}\e[0m"
    result.to_unsafe
  end
end

define_color_fn(colorRed, 31)
define_color_fn(colorGreen, 32)
define_color_fn(colorBlue, 34)
define_color_fn(colorReset, 0)