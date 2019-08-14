class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 20 }
    validates :summary, length: { maximum: 200 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    vailidate :clickbait

    
    def clickbait
        if !title.nil? && (!title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess"))
           return errors.add(:clickbait, "This is flase." )
        end
    end

    
    # if :title does not contain "Won't Believe", "Secret", "Top[number]", or "Guess"
    #     return false
    # end