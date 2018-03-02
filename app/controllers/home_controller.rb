class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:created_at).page(params[:page])

    @header_page = "New Arrival"

  end
end
