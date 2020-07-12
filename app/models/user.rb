class User < ApplicationRecord
  self.table_name = "users"
  devise :database_authenticatable, :recoverable, :rememberable, :registerable
  has_many :site_users
  has_many :sites, through: :site_users
  has_one_attached :avatar
end
