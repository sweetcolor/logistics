class DeliveriesController < ApplicationController
  def new
    # params[:destination] = :market unless params[:destination].present?
    res = get_delivery_from(params[:destination].to_sym)
    dest_begin = res[:begin]
    @start_dest = get_full_joined_dest dest_begin
    dest_end = res[:end]
    @trucks = res[:trucks]
    @ordered_destinations = get_ordered_dest(dest_end)
    @destinations = get_full_joined_dest(dest_end)
  end

  def create
  end

  private

  def destinations(dest)
    destination = choose_destinations dest
    destination.joins(destination: { destination_loads: :cargo })
  end


  def get_delivery_from(dest)
    case dest
      when :market
        trucks = TruckForProduction.joins(truck: :fuel)
        begin_dest = get_full_route Storage.joins(destination: [:routes_begin, { destination_loads: :cargo }],
                                                  truck_for_productions: { truck: :fuel })
        end_dest = destinations(dest)
      when :storage
        trucks = TruckForProduction.joins(truck: :fuel)
        begin_dest = get_full_route Enterprise.joins(destination: [:routes_begin, { destination_loads: :cargo }],
                                                     truck_for_productions: { truck: :fuel })
        end_dest = destinations(dest)
      when :enterprise
        trucks = TruckForRaw.joins(truck: :fuel)
        begin_dest = get_full_route Enterprise.joins(destination: [:routes_begin, { destination_loads: :cargo }],
                                                     truck_for_raws: { truck: :fuel })
        end_dest = destinations(dest)
      else
        trucks = nil
        begin_dest = nil
        end_dest = nil
    end
    { trucks: trucks, begin: begin_dest, end: end_dest }
  end

  def choose_destinations(dest)
    case dest
      when :market
        Market
      when :storage
        Storage
      when :raw_producer
        RawProducer
      when :enterprise
        Enterprise
      else
        Destination
    end
  end

  def joins_trucks

  end

  def get_full_joined_dest(dest)
    dest.select('destinations.id as d_id', :address, 'destinations.name as dest_name', 'cargoes.name as c_name',
                'destination_loads.capacity as dl_capacity', 'cargoes.capacity as c_capacity', :weight,
                :current_quantity, 'destination_loads.capacity - current_quantity as diff')
  end

  def get_full_route(dest)
    dest.select('destinations.id as d_id', 'destinations.name as d_name', :length, :fuel_consumption, :price,
                'trucks.name as t_name', 'routes.end_id as end_id',
                'length * fuel_consumption / 100.0 * price as road_price')
  end

  def get_ordered_dest(dest)
    dest.select('destinations.name as name, sum(destination_loads.capacity - current_quantity) as diff')
        .group('destinations.name').order('diff desc')
  end
end
