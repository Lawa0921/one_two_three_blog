class User < ApplicationRecord
  self.table_name = "users"
  devise :database_authenticatable, :recoverable, :rememberable, :registerable
end
