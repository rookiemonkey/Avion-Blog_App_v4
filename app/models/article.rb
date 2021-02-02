class Article < ApplicationRecord

    include ActiveModel::Validations
    validates_with ValidateImage

    has_one_attached :image

    validates :title,
            presence: true,
            length: { within: 5..30 }


    validates :body,
            presence: true,
            length: { within: 20..1000 }

end
