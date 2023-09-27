class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_must_be_clickbaity

    def title_must_be_clickbaity
        if title
            if !["Won't Believe", "Secret", "Top", "Guess"].any? { |w| title.include?(w) }
                errors.add(:title, "must be clickbait-y")
            end
        end
    end
end
