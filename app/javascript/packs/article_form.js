const input = document.querySelector('input[type="file"]')
const label = document.querySelector('span.file-label')

input.onchange = () => label.textContent = parseFileName()

function parseFileName() {
  const last_slash = input.value.lastIndexOf(`\\`)
  return input.value.slice(last_slash + 1, input.value.length)
}