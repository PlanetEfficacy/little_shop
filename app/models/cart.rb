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

  def items
    contents.keys.map{ |item_id| Item.find(item_id)}
  end

  def total_price
    if contents.empty?
      "0.00"
    else
    contents.map{ |id, quantity| Item.find(id).dollars * quantity }.sum
    end
  end

end
