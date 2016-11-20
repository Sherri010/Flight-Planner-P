class NodesController < ApplicationController
    before_action :authenticate
    
  def create
   new_node = Route.find(params[:route_id]).nodes.create(node_params)
    if new_node.valid?
      render :json => new_node, status: 200
    else
      render :json => {error:"failed attempt"}, status: 200
    end
  end

  private
   def node_params
    #  params[:luchador][:wins] ||= []
    #  params.permit(array:[:lat, :long])
    #params.require(:node).permit(array: [:lat, :long])
    params.require(:node).permit(:lat,:long)
   end
end
