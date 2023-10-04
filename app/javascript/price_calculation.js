window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

      const addTaxDom = document.getElementById("add-tax-price");
      const Tax = 0.1
      const priceAfterTax = inputValue * Tax
      addTaxDom.innerHTML = Math.floor(priceAfterTax)

      const profitPrice = document.getElementById("profit");
      profitPrice.innerHTML = Math.floor(inputValue - priceAfterTax)
  })

  
});
