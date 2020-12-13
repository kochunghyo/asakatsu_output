# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :output
  belongs_to :user
end
