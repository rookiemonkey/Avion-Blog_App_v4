require_relative '../uploaders/image_uploader.rb'
require 'pp'

class Article < ApplicationRecord

    mount_uploader :image, ImageUploader 
    # validate :validate_image

    validates :title,
            presence: true,
            length: { within: 5..30 }


    validates :body,
            presence: true,
            length: { within: 20..1000 }


    private

    # def validate_image
    #   return unless image.attached?

    #   unless image.byte_size <= 1.megabyte
    #     errors.add(:image, "is too big")
    #   end

    #   acceptable_types = ["image/jpeg", "image/png", "image/jpg"]

    #   unless acceptable_types.include?(image.content_type)
    #     errors.add(:image, "must be a JPEG, JPG or PNG")
    #   end
    # end

end
