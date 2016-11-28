class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :routes
  before_create :set_auth_token

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  private


  def set_auth_token
      if auth_token.present?
          return
      else
          self.auth_token = generate_auth_token
      end
  end

  def generate_auth_token
      return SecureRandom.uuid.gsub(/\-/, '')
  end
end
