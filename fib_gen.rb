# Create an enumerator "fib" that outputs successive fibonacci numbers.
# fib.take_while {|n| n < 100} # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

fib = Enumerator.new do |y|
  a = 0
  b = 1

  loop do
    y.yield b
    a,b = b, a + b
  end
end

fib.next