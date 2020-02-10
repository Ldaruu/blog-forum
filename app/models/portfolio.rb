class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  def self.react
    where(subtitle: 'React')
  end

  scope :advertising, -> { where(subtitle: 'Advertising') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Faker::Avatar.image(slug: "my-main-avatar#{:title}", size: "600x400")
    self.thumb_image ||= Faker::Avatar.image(slug: "my-thumb-avatar#{:title}", size: "350x200")
  end
end