const input = document.querySelector('input[type="file"]');
const label = document.querySelector('span.file-label');
const preview = document.querySelector('img.preview');

input.onchange = () => {

  // parse file name
  const last_slash = input.value.lastIndexOf(`\\`)
  const fileName = input.value.slice(last_slash + 1, input.value.length)
  label.textContent = fileName

  // preview uploaded image 
  const reader = new FileReader();
  reader.readAsDataURL(input.files[0])
  reader.onload = e => preview.setAttribute('src', e.target.result)

}