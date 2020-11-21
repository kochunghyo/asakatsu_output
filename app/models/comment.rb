class Comment < ApplicationRecord
  belongs_to :output
  belongs_to :user
end
