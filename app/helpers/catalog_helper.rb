module CatalogHelper
  include Blacklight::CatalogHelperBehavior
  def should_render_facet?(display_facet)
    # display when show is nil or true
    facet_config = facet_configuration_for_field(display_facet.name)
    display = should_render_field?(facet_config, display_facet)
    return true if display_facet.is_a? CatalogController::Placeholder
    display && display_facet.items.present?
  end
end
