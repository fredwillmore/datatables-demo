class CometsController < ApplicationController

  def index
    respond_to do |format|
      @draw = params[:draw] || 1
      @comets = Comet.search(
        params.dig(:search, :value),
        { page: page,
          page_length: page_length,
          sort_order: sort_order,
          sort_direction: sort_direction } )
      format.html
      format.json
    end
  end

end
