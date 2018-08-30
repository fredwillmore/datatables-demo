class ApplicationController < ActionController::Base
  helper_method :search_start_date, :search_end_date

  # def search_start_date
  #   Date.parse params[:start_date] rescue default_search_start_date
  # end
  # 
  # def search_end_date
  #   Date.parse params[:end_date] rescue default_search_end_date
  # end

  protected

  def sort_direction
    params.dig(:order, '0', 'dir') || 'DESC'
  end

  def sort_order
    params.dig(:columns, params.dig(:order, '0', 'column'), 'name') || 'default'
  end

  # def default_search_start_date
  #   2.weeks.ago
  # end
  # 
  # def default_search_end_date
  #   Date.today
  # end

  def render_datatable_json(objects, presenter_class = nil)
    render json: objects,
      serializer: serializer_class,
      root: false,
      records_filtered_count: objects.count,
      sEcho: params[:sEcho],
      view_context: view_context,
      presenter_class: presenter_class
  end

  def page
    params[:start].to_i / page_length.to_i + 1
  end

  def page_length
    params[:length] || 20
  end

  def serializer_class
    "#{controller_path.split('/').map(&:camelize).join('::')}Serializer".constantize rescue raise NotImplementedError
  end

  helper_method :presenter_class
  def presenter_class
    "#{controller_path.split('/').map(&:camelize).join('::').singularize}Presenter".constantize rescue raise NotImplementedError
  end
end
