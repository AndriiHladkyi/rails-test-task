class Post < ApplicationRecord
  belongs_to :category

  validates :text, :category_id, presence: true

  scope :of_category, ->(category) { where(category_id: category) }
  scope :delete_shared_urls, -> {
    where(['updated_at < ?', 15.minutes.ago]).each { |post| post.update(shared_url: nil) }
  }

  def to_param
    "#{id}-#{shared_url}"
  end
end
