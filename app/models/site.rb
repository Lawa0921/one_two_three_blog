class Site < ApplicationRecord
  has_many :site_users
  has_many :users, through: :site_users
end
