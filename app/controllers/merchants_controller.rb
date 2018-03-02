class MerchantsController < InheritedResources::Base
  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @products = Merchant.new.our_product(params[:id]).page(params[:page])
    @merchant = Merchant.find(params[:id])
  end
  private

    def merchant_params
      params.require(:merchant).permit(:name, :image_url, :description, :products_id)
    end
end
