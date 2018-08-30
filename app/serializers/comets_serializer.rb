class CometsSerializer < BaseDatatableSerializer

  def data_fields
    [
      :id,
      :name,
      :diameter,
      :albedo,
    ]
  end

end
