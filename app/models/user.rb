class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :registerable
end
