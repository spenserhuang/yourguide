module ToursHelper
  def current_tour
    @current_tour ||= Tour.where(id: session[:tour_id]).first if session[:tour_id]
  end
end
