class Node < ApplicationRecord
  belongs_to :route

  validates :lat, presence: true
  validates :long, presence: true
end
