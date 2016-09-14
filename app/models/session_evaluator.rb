class SessionEvaluator
  attr_reader :session

  def initialize(session)
    @session = session
  end

  def redirect_to_cart
    session[:cart] ? true : false
  end

  def redirect_to_dashboard
    session[:cart] ? false : true
  end
end
