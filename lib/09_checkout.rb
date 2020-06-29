class CheckoutItem
  def initialize(rules)
    @rules = rules
  end

  def multibuy_price
    @rules[:multibuy_price]
  end

  def multibuy_quantity
    @rules[:multibuy_quantity]
  end

  def unit_price
    @rules[:unit_price]
  end

  def multibuy_available?
    !multibuy_price.nil? && !multibuy_quantity.nil?
  end
end

class Checkout
  INITIAL_TOTAL = 0

  def initialize(rules)
    @rules = rules
    @items = []
  end

  def scan(item)
    @items.push(item)
  end

  def total
    item_counts.reduce(INITIAL_TOTAL) do |total, _|
      sku, count = _
      item = lookup_item(sku)

      if item.multibuy_available?
        quotient, modulus = count.divmod(item.multibuy_quantity)
        total += (quotient * item.multibuy_price) + (modulus * item.unit_price)
      else
        total += count * item.unit_price
      end
    end
  end

  private

  def lookup_item(sku)
    CheckoutItem.new(@rules[sku])
  end

  def item_counts
    @items.each_with_object({}) { |item, counts|
      if counts[item]
        counts[item] += 1
      else
        counts[item] = 1
      end
    }
  end
end