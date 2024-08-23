class DatatableConfiguration
  def self.columns
    throw NotImplementedError
  end
  
  def self.search_fields()
    throw NotImplementedError
  end

  def self.default_sort
    throw NotImplementedError
  end  
end
