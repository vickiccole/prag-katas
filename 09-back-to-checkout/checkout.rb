class CheckOut
  def initialize(rules)
    @rules = rules
    @basket = Hash.new(0)
  end

  def scan(item)
    @basket[item] += 1
  end
  
  def total
    @basket.reduce(0) do |total, (sku, num_items)|
      total + @rules[sku].call(num_items)
    end 
  end
end