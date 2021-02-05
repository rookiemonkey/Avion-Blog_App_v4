require_relative '../uploaders/image_uploader.rb'
require 'pp'
require 'mimemagic'

class Article < ApplicationRecord

    mount_uploader :image, ImageUploader 
    validate :validate_image

    validates :title,
            presence: true,
            length: { within: 5..30 }


    validates :body,
            presence: true,
            length: { within: 20..1000 }


            
    private

    def validate_image
        # halt if no image uploaded
        return if image.file.nil?

        # check file size
        errors.add(:image, "is too big") if image.size >= 1000000 #1mb

        # check mime type
        analysis = MimeMagic.by_magic(File.open(image.file.file))

        errors.add(:image, "is not a valid image") unless  %w(png jpg jpeg).include? analysis.subtype

    end

end
