class Price

  def initialize(price, discount=0, discount_qty=0)
    @price = price
    @discount = discount
    @discount_qty = discount_qty
  end

  def price_for_item(qty)
    qty * @price - discount_for_item(qty)
  end

  def discount_for_item(qty)
    if @discount != 0
      (qty / @discount_qty).floor * @discount
    else
      0
    end
  end

end

RULES = {
  'A' => Price.new(50, 20, 3),
  'B' => Price.new(30, 15, 2),
  'C' => Price.new(20),
  'D' => Price.new(15)   
}

class CheckOut

  def initialize(rules)
    @rules = rules
    @items = Hash.new
  end

  def scan(item)
    if @items[item].nil?
      @items[item] = 0
    end
    @items[item] += 1
  end

  def total
    @items.reduce(0) do |x, (item, qty)|
      x + item_price(item, qty)
    end
  end

  private

  def item_price(item, qty)
    if rule_for(item)
      rule_for(item).price_for_item(qty) 
    else
      raise "Item '#{item}' not valid!"
    end
  end

  def rule_for(item)
    @rules[item]
  end

end

