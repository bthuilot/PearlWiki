class Post < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: {maximum: 50}

  def self.search(term, category_id)
    if term
      category_id ? where('title LIKE ? AND category_id = ?', "%#{term}%", category_id) : where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
