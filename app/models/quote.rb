class Quote < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites

    def split_quote_array
        split_quote = self.content.split(" ")
        # post action will strip punctuation from word in quote_controller
    end

end
