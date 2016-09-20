class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def remove_item(item_id)
    contents.delete(item_id.to_s)
  end

  def decrease_quantity(item_id)
    contents[item_id.to_s] -= 1
  end

  def increase_quantity(item_id)
    contents[item_id.to_s] += 1
  end

  def items
    contents.keys.map{ |item_id| Item.find(item_id)}
  end

  def quantity(item_id)
    contents[item_id.to_s]
  end

  def price(item_id)
    Item.find(item_id).price
  end

  def subtotal(item_id)
    quantity(item_id) * price(item_id)
  end

  def has_more_than_one(item_id)
    !!quantity(item_id) && quantity(item_id) > 1
  end

  def total_price
    contents.map{ |id, quantity| price(id) * quantity }.sum
  end
end
