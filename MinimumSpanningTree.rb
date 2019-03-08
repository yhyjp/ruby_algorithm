# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_2_A&lang=jp
# Spanning Tree - Minimum Spanning Tree

class PriorityQueue
  def initialize()
    @data = []
  end

  def push(x)
    i = @data.bsearch_index { |y| y > x }
    if i
      @data.insert(i, x)
    else
      @data.push(x)
    end
  end

  def length()
    @data.length
  end

  def pop()
    @data.shift
  end
end

class St
  attr :p, :cost

  def initialize(p, cost)
    @p = p
    @cost = cost
  end

  def >(other)
    @cost > other.cost
  end
end

class MST
  def initialize(nv)
    @adj = Array.new(nv) { Array.new }
    @nv = nv
  end

  def connect(a, b, w)
    @adj[a].push({ to: b, cost: w })
    @adj[b].push({ to: a, cost: w })
  end

  def calc
    que = PriorityQueue.new
    que.push(St.new(0, 0))
    visited = Array.new(@nv, false)
    sum = 0
    while que.length > 0
      cur = que.pop
      next if visited[cur.p]
      visited[cur.p] = true
      sum += cur.cost
      @adj[cur.p].each do |e|
        que.push(St.new(e[:to], e[:cost])) if !visited[e[:to]]
      end
    end
    sum
  end
end

nv, ne = gets.split.map(&:to_i)
mst = MST.new(nv)
ne.times do
  a, b, w = gets.split.map(&:to_i)
  mst.connect(a, b, w)
end

puts mst.calc
