class MaxIntSet
	attr_reader :store, :max

  def initialize(max)
		@store = Array.new(max, false)
		@max = max 
  end

  def insert(num)
		validate!(num)
		@store[num] = true
  end

  def remove(num)
		validate!(num)
		@store[num] = false
  end

  def include?(num)
		validate!(num)
		@store[num]
  end

  private

  def is_valid?(num)
		num.between?(0, max - 1)
  end

  def validate!(num)
		raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
	attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
		return if include?(num)
		self[num] << num 
  end

  def remove(num)
		return unless include?(num)
		self[num].delete(num)
  end

  def include?(num)
		self[num].include?(num)
  end

  protected

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
		@store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
		resize! if count >= num_buckets
		return if include?(num)
		self[num] << num 
		@count += 1
  end

  def remove(num)
		return unless include?(num)
		self[num].delete(num)
		@count -= 1
  end

  def include?(num)
		self[num].include?(num)
  end

  protected

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
		@store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
		old_store = self.store
		@count = 0
		@store = Array.new(num_buckets * 2) { Array.new }
		old_store.each do |bucket|
			bucket.each do |num|
				insert(num)
			end
		end
  end
end
