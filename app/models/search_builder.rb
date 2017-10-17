# frozen_string_literal: true
class SearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior

  ##
  # @example Adding a new step to the processor chain
  #   self.default_processor_chain += [:add_custom_data_to_query]
  #
  #   def add_custom_data_to_query(solr_parameters)
  #     solr_parameters[:custom] = blacklight_params[:user_value]
  #   end

  def facet_fields_to_include_in_request
    blacklight_config.facet_fields.select do |_field_name, facet|
      !facet.loading &&
        (facet.include_in_request ||
          (facet.include_in_request.nil? && blacklight_config.add_facet_fields_to_solr_request))
    end
  end
end
