module Placeholder
	extend ActiveSupport::Concern

	def self.image_generator(height:, width:)
		Faker::Avatar.image(slug: "my-main-avatar#{width}", size: "#{height}x#{width}")
	end
end