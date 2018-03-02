class CustomerController < ApplicationController
  def index
    if user_signed_in?
    else
      #code
    end
  end
end
