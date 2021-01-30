class Article < ApplicationRecord

    validates :title,
            presence: true,
            length: { within: 5..30 }


    validates :body,
            presence: true,
            length: { within: 20..1000 }

end
