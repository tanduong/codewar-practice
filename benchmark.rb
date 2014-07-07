
require 'benchmark'

def get_squares1(array)
  array.select {|x| x % (Math.sqrt x) == 0}.sort.uniq
end

def get_squares2(array)
  array.select {|x| x == Math.sqrt(x).round ** 2 }.sort.uniq
end

def get_squares3(array)
  array.select {|n| Math.sqrt(n).to_i == Math.sqrt(n)}.uniq.sort
end

iterations = 1000

Benchmark.bm do |bm|
  # using string interpolation
  bm.report do
    iterations.times do
      get_squares1(1_000_000_000_000_000...1_000_000_000_001_000)
    end
  end

  bm.report do
    iterations.times do
      get_squares2(1_000_000_000_000_000...1_000_000_000_001_000)
    end
  end

  bm.report do
    iterations.times do
      get_squares3(1_000_000_000_000_000...1_000_000_000_001_000)
    end
  end
end