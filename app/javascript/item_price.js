function post (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const taxAmount = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxAmount;

    const addProfitDom = document.getElementById("profit");
    const profitAmount = Math.floor(inputValue - taxAmount);
    addProfitDom.innerHTML = profitAmount;
  });
};

window.addEventListener('turbo:load', post);