class Post < ApplicationRecord
  belongs_to :category

  validates :text, :category_id, presence: true

  scope :of_category, ->(category) { where(category_id: category) }

  def to_param
    "#{id}-#{shared_url}"
  end
end
