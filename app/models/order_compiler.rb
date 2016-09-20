class OrderCompiler
  attr_reader :cart, :order

  def initialize(cart, current_user)
    @cart = cart
    @order = Order.create(user_id: current_user.id)
    generate
  end

  def generate
    cart.map do |item_id, quantity|
      ItemOrder.create( item_id: item_id.to_i,
                        quantity: quantity,
                        order_id: order.id  )
    end
  end

  def total
    order.item_orders.map do |item_order|
      item_order.subtotal
    end.sum
  end
end
