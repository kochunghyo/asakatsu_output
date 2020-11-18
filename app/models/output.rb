class Output < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :images, presence: true
  validates :text, presence: true



end
 