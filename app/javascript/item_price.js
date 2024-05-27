const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const taxAmount = Math.round(inputValue * 0.1);
    addTaxDom.innerHTML = taxAmount;

    const addProfitDom = document.getElementById("profit");
    const profitAmount = Math.round(inputValue - taxAmount);
    addProfitDom.innerHTML = profitAmount;
});
