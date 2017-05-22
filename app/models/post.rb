class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

  def clickbaity
    if !(title.nil? || CLICKBAIT.any? { |word| title.include?(word) })
      errors.add(:clickbait, "The title is not sufficiently clickbait-y")
    end
  end
end
