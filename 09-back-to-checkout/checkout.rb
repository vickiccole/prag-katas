class CheckOut
  def initialize(rules)
    @rules = rules
    @basket = Hash.new(0)
  end

  def scan(sku)
    @basket[sku] += 1
  end

  def total
    @basket.reduce(0) do |total, (sku, num_items)|
      total + @rules[sku].call(num_items)
    end
  end
end

module Rule
  def self.costs(unit_price)
    ->(num_items) { num_items * unit_price }
  end

  def self.special_buy(unit_price:, buy:, pay:)
    ->(num_items) do
      (num_items / buy * pay) +
      (num_items % buy * unit_price)
    end
  end
end
