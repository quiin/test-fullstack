module ApplicationHelper

	# Returns the locale path for model and attribute
	def trans(model = nil, attribute = nil)
		t("activerecord.attributes.#{model}.#{attribute}".to_sym)
	end

	def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end    
    link_to(name, "#", "data-association" => "#{association}" , "data-content" => "#{fields}", :class => "link_to_add_fields edit-link" )
  end
end
