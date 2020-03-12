document.querySelectorAll("input[name='_method']").forEach((buggedInput) => {
  buggedInput.value = "patch";
})
