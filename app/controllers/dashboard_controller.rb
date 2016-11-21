class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    render "index", layout: "angular"
  end
end
