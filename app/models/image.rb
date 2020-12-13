# frozen_string_literal: true

class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :output
end
