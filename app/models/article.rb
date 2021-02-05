require_relative '../uploaders/image_uploader.rb'
require 'pp'

class Article < ApplicationRecord

    mount_uploader :image, ImageUploader 
    validate :validate_image_size

    validates :title,
            presence: true,
            length: { within: 5..30 }


    validates :body,
            presence: true,
            length: { within: 20..1000 }


            
    private

    def validate_image_size
        errors.add(:image, "is too big") if image.size >= 1000000 #1mb
    end

end
