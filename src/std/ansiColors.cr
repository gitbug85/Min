macro define_color_fn(name, code)
  fun {{name.id}}(input : UInt8*) : UInt8*
    crystal_str = String.new(input)
    result = "\e[{{code}}m#{crystal_str}\e[0m"
    result.to_unsafe
  end
end

define_color_fn(crColorRed, 31)
define_color_fn(crColorGreen, 32)
define_color_fn(crColorBlue, 34)
define_color_fn(crColorReset, 0)