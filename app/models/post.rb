class Post < ApplicationRecord
#     All posts have a title
#  Post content is at least 250 characters long
#  Post summary is a maximum of 250 characters
#  Post category is either Fiction or Non-Fiction. 
#  This step requires an inclusion validator, which was not outlined in the lesson.
#  You'll need to refer to the Rails guideLinks to an external site. to look up how to use it.

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
