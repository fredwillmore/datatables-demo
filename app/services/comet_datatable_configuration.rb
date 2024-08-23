class CometDatatableConfiguration < DatatableConfiguration
  def self.columns
    {
      id: { header_text: "ID", orderable: 'false', searchable: 'false' },
      full_name: { header_text: "Full Name", searchable: 'true', orderable: 'true' },
      diameter: { header_text: "Diameter (km)", searchable: 'false', orderable: 'true' },
      albedo: { header_text: "Albedo", searchable: 'false', orderable: 'true' },
    }
  end
  
  def self.search_fields()
    [ :full_name ]
  end

  def self.default_sort
    :full_name
  end  
end
