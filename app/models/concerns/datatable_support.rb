module DatatableSupport
  extend ActiveSupport::Concern
  
  class_methods do
    def search(term, options = {})
      where(
        search_fields.map { |field| "LOWER(#{field.to_s}) like ?" }.join(' OR '), 
        *search_fields.map { "%#{term.to_s.strip.downcase}%" }
      )
        .order(order_clause options)
        .paginate(
          page: options[:page],
          per_page: options[:page_length]
        )
    end

    def datatable_columns
      throw NotImplementedError
    end

    def search_fields
      throw NotImplementedError
    end

    def sort_by sort_order
      sort_order.presence || default_sort
    end

    def order_clause(options)
      { sort_by(options[:sort_order]).to_sym => (options[:sort_direction] || :asc).to_sym }
    end
  end

end