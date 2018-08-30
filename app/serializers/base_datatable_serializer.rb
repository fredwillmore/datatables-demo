class BaseDatatableSerializer < ActiveModel::Serializer
  attributes :draw, :iTotalRecords, :iTotalDisplayRecords, :aaData, :sEcho

  def data_fields
    []
  end

  def draw
    1
  end

  def iTotalRecords
    instance_options[:records_count] || -1
  end

  def iTotalDisplayRecords
    @object.count
  end

  def sEcho
    instance_options[:sEcho]
  end

  def aaData
    data = []
    @object.each do |item|
      v.present item, presenter_class do |presenter|
        data << data_fields.map { |f| presenter.send f }
      end
    end
    data
  end

  private

  def v
    instance_options[:view_context]
  end

  def presenter_class
    instance_options[:presenter_class]
  end

end
