class StrigowlsController < ApplicationController

    def new
      @strigowl = Strigowl.new
    end
  
    def create
        @strigowl = Strigowl.new(strigowl_params)
        @strigowl.product_id = params[:product_id]
        @strigowl.user = current_user
        if @strigowl.save
            UserMailer.with(strigowl: @strigowl, user: current_user).confirmation.deliver_now
            redirect_to profiles_path
        else
            redirect_to products_path
        end
    end
  
    def show
        
    end

    def destroy
        @strigowl = Strigowl.find(params[:id])
        @strigowl.destroy
        redirect_to profile_path
    end

    def strigowl_params
        params.require(:strigowl).permit(:bidding_price, :product_id)
    end
  
end