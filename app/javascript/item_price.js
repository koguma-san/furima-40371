function post (){
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    if (!priceInput.dataset.listenerAdded) {
      priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;

        const addTaxDom = document.getElementById("add-tax-price");
        const taxAmount = Math.floor(inputValue * 0.1);
        addTaxDom.innerHTML = taxAmount;

        const addProfitDom = document.getElementById("profit");
        const profitAmount = Math.floor(inputValue - taxAmount);
        addProfitDom.innerHTML = profitAmount;
      });
      priceInput.dataset.listenerAdded = "true"; 
    }
  }
};

window.addEventListener('turbo:load', post);
window.addEventListener('turbo:render', post);
window.addEventListener('DOMContentLoaded', post);