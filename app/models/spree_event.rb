class SpreeEvent < ApplicationRecord
  validates :body, presence: true
end
