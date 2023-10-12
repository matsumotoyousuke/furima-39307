window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

      const Tax = 0.1
      const priceAfterTax = Math.floor(inputValue * Tax)
      const addTaxDom = document.getElementById("add-tax-price");
      const profitPrice = document.getElementById("profit");
      addTaxDom.innerHTML = priceAfterTax
      profitPrice.innerHTML = inputValue - priceAfterTax
  })

  
});
