class OrderCompiler
  attr_reader :cart, :order

  def initialize(cart, current_user)
    @cart = cart
    @order = Order.create(user_id: current_user.id)
  end

  def populated_item_order
    invoice = cart.map do |item_id, quantity|
      ItemOrder.create(item_id: item_id.to_i, quantity: quantity, order_id: order.id)
    end
    invoice
  end
end