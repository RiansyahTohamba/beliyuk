module ApplicationHelper
  def add_to_cart_btn(product_id)
     if user_signed_in? && Product.new.my_product?(product_id,current_user.id)
         button_to 'Add to Cart', line_items_path(product_id: product_id), remote: true
     elsif !user_signed_in?
       content_tag(:b, "sign in to buy")
     end
  end
  def get_link_merchant(user_id)
    begin
      content_link  = link_to Merchant.new.get_name(current_user.id),customers_merchants_path, method: 'get'
      content_tag(:li , content_link)
    rescue
    end
  end

  def display_merchant(merchant_image)
    if merchant_image.file.exists?
      image_tag merchant_image
    else
      image_tag 'default-merchant.png'
    end
  end

  def display_product(product_image)
    if product_image.file.exists?
      image_tag product_image
    else
      image_tag 'default-product.jpg'
    end
  end

end
