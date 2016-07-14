class MapController < ApplicationController

  class Marker
    attr_accessor :id, :lat, :lng, :title

    def initialize(id, lat, lng, title)
      @id = id
      @lat = lat
      @lng = lng
      @title = title
    end
  end


  before_action do
    @markers = []
    @markers << Marker.new(1, 29.7, -95.3, "Houston")
    @markers << Marker.new(2, 29.5, -95.0, "Unknown")
  end

  def show
  end
end
