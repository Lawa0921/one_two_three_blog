class Post < ApplicationRecord
  belongs_to :site
  has_rich_text :content
end
