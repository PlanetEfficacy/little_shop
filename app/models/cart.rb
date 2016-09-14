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
    contents[item_id.to_s] -= 1
    contents.delete_if {|id, quantity| quantity == 0 }
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
    Item.find(item_id).dollars
  end

  def subtotal(item_id)
    quantity(item_id) * price(item_id)
  end

  def has_more_than_one(item_id)
    quantity(item_id) > 1
  end

  def total_price
    # if contents.empty?
    #   "0.00"
    # else
    contents.map{ |id, quantity| Item.find(id).dollars * quantity }.sum
    # end
  end

end
