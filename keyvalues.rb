require 'benchmark'

def keysAndValues1(data)
  [data.keys, data.values]
end

def keysAndValues2(data)
  keys = []
  vals = []
  data.count.times do |n|
  	keys[n] = data.keys[n]
  	vals[n] = data.values[n]
  end
  [keys, vals]
end

def keysAndValues3(data)
  data.to_a.transpose
end

iterations = 100_000

Benchmark.bm do |bm|
  bm.report do
    iterations.times do
      keysAndValues1({a: 1, b: 2, c: 3})
    end
  end

  bm.report do
    iterations.times do
      keysAndValues2({a: 1, b: 2, c: 3})
    end
  end

  bm.report do
    iterations.times do
      keysAndValues3({a: 1, b: 2, c: 3})
    end
  end
end