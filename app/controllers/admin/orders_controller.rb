class Admin::OrdersController < Admin::BaseController
  before_action :require_admin

  def index
    @orders = Order.ordered if params["status"] == "0"
    @orders = Order.paid if params["status"] == "1"
    @orders = Order.cancelled if params["status"] == "2"
    @orders = Order.completed if params["status"] == "3"
  end
end
