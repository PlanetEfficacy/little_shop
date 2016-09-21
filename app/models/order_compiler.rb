class OrderCompiler
  attr_reader :cart, :order

  def initialize(cart, current_user)
    @cart = cart
    @order = Order.create(user_id: current_user.id)
  end

  def generate
    cart.map do |item_id, quantity|
      ItemOrder.create( item_id: item_id.to_i,
                        quantity: quantity,
                        order_id: order.id  )
    end
  end

  def calculate_order_total
    subtotals = cart.map do |item_id, quantity|
      Item.find(item_id).price * quantity
    end
    order.update(total: subtotals.reduce(:+))
  end

end
