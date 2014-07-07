class Object
  %w(zero one two three four five six seven eight nine).each_with_index do |name, n|
    define_method(name) { |params = nil| params ? n.send(*params) : n.to_f }
  end

  %w(plus + minus - times * divide_by /).each_slice(2) do |name, symbol|
    define_method(name) { |n| [symbol, n] }
  end
end

p four(times(4))