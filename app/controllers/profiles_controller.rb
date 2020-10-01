class ProfilesController < ApplicationController

    def index
      @strigowls = Strigowl.all
    end
  
    def show
      @strigowls = Strigowl.where(user_id: current_user.id)
      @strigowls_pending = Strigowl.where(status: "En attente d'execution", user: current_user)
      @strigowls_executed = Strigowl.where(status: "Executée !", user: current_user)
    end
  
    def new
      @strigowl = Strigowl.new
    end

end