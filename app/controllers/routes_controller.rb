class RoutesController < ApplicationController
  before_action :routes, only: :show

  def show
  end

  private

  def routes
    @begins = Destination.joins(params[:begin].to_sym)
    @ends = Destination.joins(params[:end].to_sym)
    # @routes = Route.joins(:destination_begin, :destionation_end).select(:length, '')
  end
end

