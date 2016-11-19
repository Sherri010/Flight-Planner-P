class RoutesController < ApplicationController

  def index
     render :json => Route.all,status: 200
  end

  def show
    route = Route.find(params[:id])
    node = route.nodes
    result = {"routes": route, "nodes":node}
   if route
     render :json => result,status: 200
   else
     render :json => {error:"not found"},status: 400
   end
  end

  def create
    #  @cust.houses.create(params[:house])
   p params
   user = User.find(params[:user_id])
   final = user.routes.create(:name => params[:name],:distance =>params[:distance])
   if final
     render :json =>{success:"OK"}, status: 200
   else
     render :json => {error:"FAILED"}, status: 400
  end
end
private
  def route_params
    params.require(:route).permit(:name,:distance,:user_id)
  end

end
