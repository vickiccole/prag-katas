class MultibuyDiscount
  def initialize(multibuy_quantity, multibuy_price)
    @multibuy_quantity = multibuy_quantity
    @multibuy_price = multibuy_price
  end
  
  def apply(item, count)
    quotient, modulus = count.divmod(@multibuy_quantity)
    (quotient * @multibuy_price) + (modulus * item.unit_price)
  end
end

class NullDiscount
  def apply
    item ...
  end
end
class KeyWorkerDiscount
  def initialize(percentage_discount)
    @percentage_discount = percentage_discount
  end

  def apply(item, count)
    (count * item.unit_price) * (@percentage_discount / 100.0)
  end
end

class Discount
  def self.for(discount)
    type, options = discount.values_at(:type, :options)
    case type
    when :multibuy
      MultibuyDiscount.new(options[:quantity], options[:price])
    when :key_worker
      KeyWorkerDiscount.new(options[:percentage_discount])
    else
      raise 'Unsupported discount type'
    end
  end
end

class CheckoutItem
  attr_reader :sku, :unit_price

  def initialize(sku, unit_price, discounts)
    @sku = sku
    @unit_price = unit_price
    @discounts = discounts
  end

  def discounts
    @discounts.nil? ? [] : @discounts.map {|d| Discount.for(d) }
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

      if item.discounts.any?
        # do we want to apply all discounts if more than one exists?
        total += item.discounts.reduce(INITIAL_TOTAL) do |memo, discount|
          memo += discount.apply(item, count)
        end
      else
        total += count * item.unit_price
      end
    end
  end

  private

  def lookup_item(sku)
    unit_price, discounts = @rules[sku].values_at(:unit_price, :discounts)
    CheckoutItem.new(sku, unit_price, discounts)
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