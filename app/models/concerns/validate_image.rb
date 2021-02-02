class ValidateImage < ActiveModel::Validator

  def validate(record)

    # image is uploaded w/o validation
    # image not upload w/ validation, but no error message returned

    # return unless record.attached?

    # unless record.byte_size <= 1.megabyte
    #   errors.add("image is too big")
    # end

    # acceptable_types = ["image/jpeg", "image/png"]
    # unless acceptable_types.include?(record.content_type)
    #   errors.add("image must be a JPEG or PNG")
    # end

  end

end