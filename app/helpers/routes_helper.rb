module RoutesHelper
  def find_route_by_destinations(dest_begin, dest_end)
    Route.where(begin_id: dest_begin.id, end_id: dest_end.id).first
  end
end
