class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, presence: true

  def self.search(search_term)
    like_operator = Rails.env.development? ? 'like' : 'ilike'
    Product.where("name #{like_operator} ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.order(:rating)
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}")
  end

  def viewed!
    $redis.incr("product:#{id}")
  end
end