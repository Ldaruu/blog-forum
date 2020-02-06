class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.design
    where(subtitle: "Design")
  end

  scope :IT, -> { where(subtitle: "IT")}
end
