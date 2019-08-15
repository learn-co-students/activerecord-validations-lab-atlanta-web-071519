class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    # %w() automatically turns it into an array of string
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
    validate :clickbait
  

    def clickbait
        if(title != nil && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [number]") || title.include?("Guess")))
        else 
            return errors.add(:clickbait, "This is false")
        end
    end
end
