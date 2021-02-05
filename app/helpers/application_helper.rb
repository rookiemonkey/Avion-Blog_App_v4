module ApplicationHelper

  def toastr_flash
    
    flash.each_with_object([]) do |(type, message), flash_messages|
      
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'

      # multi-line string has returns '\n', used squish to remove it
      text = "<script>
        toastr.#{type}(\"#{message}\", '', { 
            closeButton: true, 
            progressBar: true,
            positionClass: 'toast-top-center'
          })
      </script>".squish

      flash_messages << text.html_safe if message
      flash_messages.join("\n")
    end
  end

end
