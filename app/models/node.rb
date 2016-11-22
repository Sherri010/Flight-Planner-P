class Node < ApplicationRecord
  belongs_to :route

  validates :lat, presence: true
  validates :lng, presence: true
end
