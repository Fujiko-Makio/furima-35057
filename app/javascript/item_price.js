window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    const tax = Math.floor(inputValue * 0.1)
    const profit = inputValue - tax
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = tax
    const addProfit = document.getElementById("profit")
    addProfit.innerHTML = profit
  })
})