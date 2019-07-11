class Post < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: {maximum: 50}

  def self.search(term, category_id)
    if term and category_id
      where('title LIKE ? AND category_id = ?', "%#{term}%", category_id)
    elsif term
      where('title LIKE ?', "%#{term}%")
    elsif category_id
      where category_id: category_id
    else
      all
    end
  end
end
