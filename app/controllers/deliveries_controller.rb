class DeliveriesController < ApplicationController
  before_action :new, :destinations
  before_action :new, :routes

  def new
  end

  def create
  end

  private

  def routes
    @routes = Route.all
  end

  def destinations
    @markets = get_dest(:market, 'desc')
    @storages = get_dest(:storage, 'asc')
    @raw_producers = get_dest(:raw_producer, 'asc')
    @enterprises = get_dest(:enterprise, 'asc')
  end

  def get_dest(dest, order)
    Destination.joins(dest).order('capacity - current_quantity %s' % order)
  end

end
