class Route < ApplicationRecord
  belongs_to :user
  has_many :nodes

  validates :name, presence: true
  validates :distance, presence: true
  validates :user_id, presence: true

  before_destroy :destroy_nodes

  private

  def destroy_nodes
    self.nodes.delete_all   
  end

end
