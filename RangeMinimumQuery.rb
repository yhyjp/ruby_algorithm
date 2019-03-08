# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DSL_2_A
# Range Query - Range Minimum Query (RMQ)
class RMQ
  def initialize(n, max)
    @max = max
    @n = 2 ** Math.log2(n).ceil
    @dat = Array.new(@n * 2, @max)
  end

  def update(i, x)
    i += @n - 1
    @dat[i] = x
    while i.positive?
      i = (i - 1) / 2
      @dat[i] = [@dat[i * 2 + 1], @dat[i * 2 + 2]].min
    end
  end

  def query(a, b, k = 0, l = 0, r = @n)
    return @max if r <= a || b <= l
    return @dat[k] if a <= l && r <= b
    vl = query(a, b, k * 2 + 1, l, (l + r) / 2)
    vr = query(a, b, k * 2 + 2, (l + r) / 2, r)
    [vl, vr].min
  end
end

n, q = gets.split.map(&:to_i)
rmq = RMQ.new(n, (2 ** 31) - 1)
q.times do
  com, x, y = gets.split.map(&:to_i)
  if com.zero?
    rmq.update(x, y)
  elsif com == 1
    puts rmq.query(x, y + 1)
  end
end
