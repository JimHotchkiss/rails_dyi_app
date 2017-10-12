class User < ApplicationRecord
  has_secure_password
  has_many :projects

  validates :username, presence: true
  validates :username, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(username: auth_hash['info']['name']).first_or_create do |user|
   # Specify the data you’re looking for. If it exists in the table, the first instance will be returned. If not, then create is called.

      user.password = SecureRandom.hex
    end
  end
end
