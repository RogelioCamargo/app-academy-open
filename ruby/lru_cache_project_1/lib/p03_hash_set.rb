class HashSet
  attr_reader :store, :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
		return false if include?(key)
		self[key] << key 
		@count += 1
		resize! if count >= num_buckets
		key
  end

  def include?(key)
		self[key].include?(key)
  end

  def remove(key)
		return nil unless include?(key)
		self[key].delete(key)
		@count -= 1
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
		@store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
		old_store = @store 
		@count = 0 
		@store = Array.new(num_buckets * 2) { Array.new }
		old_store.each do |bucket|
			bucket.each do |key|
				insert(key)
			end
		end
  end
end
