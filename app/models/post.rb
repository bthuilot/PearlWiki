class Post < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: {maximum: 50}
end
