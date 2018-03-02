class ProductsController < InheritedResources::Base
  include CurrentCart
  before_action :set_cart
  

  def new_arrivals
    @products = Product.order(:created_at).page(params[:page])
    @header_page = "New Arrival"
  end

  def most_populars
    @products = Product.order(:created_at).page(params[:page])

    @header_page = "Most Popular"
  end

  def official_brands
    @products = Product.order(:created_at).page(params[:page])

    @header_page = "Official Brand"
  end
  private

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
end
