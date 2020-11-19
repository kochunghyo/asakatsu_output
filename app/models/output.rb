class Output < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to_active_hash :type

  validates :title, presence: true
  validates :images, presence: true
  validates :text, presence: true
  validates :type_id, presence: true
end
 