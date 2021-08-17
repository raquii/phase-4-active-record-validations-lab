class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :must_be_click_bate

    CLICKBATE = [/Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i]

    def must_be_click_bate
        if CLICKBATE.none? { |b| b.match title}
            errors.add(:title, "Title must contain clickbate nonsense")
        end
    end

end
