class DashboardsController < ApplicationController
  def mydashboard
    @reservations = current_user.reservations
    @houses = current_user.houses
  end
end
