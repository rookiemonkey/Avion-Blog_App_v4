const input = document.querySelector('input[type="file"]');
const label = document.querySelector('span.file-label');
const preview = document.querySelector('img.preview');

input.onchange = () => {
  const file = input.files[0];

  // check file size
  if (file.size > 1000000) return alert('File is too big')

  // check mime type
  const valid_mime = ['image/png', 'image/jpeg', 'image/jpg']
  const is_valid = valid_mime.some(t => t == file.type)
  if (!is_valid) return alert('We only accept jpeg, jpg and png files')

  // parse file name
  const last_slash = input.value.lastIndexOf(`\\`)
  const fileName = input.value.slice(last_slash + 1, input.value.length)
  label.textContent = fileName

  // preview uploaded image 
  const reader = new FileReader();
  reader.readAsDataURL(input.files[0])
  reader.onload = e => preview.setAttribute('src', e.target.result)

}