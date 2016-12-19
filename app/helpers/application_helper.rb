module ApplicationHelper

	# Returns the locale path for model and attribute
	def trans(model = nil, attribute = nil)
		t("activerecord.attributes.#{model}.#{attribute}".to_sym)
	end
end
