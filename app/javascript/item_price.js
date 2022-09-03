window.addEventListener('load', () => {
  
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    console.log(inputValue); 
    addTaxDom.innerHTML = Math.floor((inputValue) * 0.1);
    profitDom.innerHTML = Math.floor((inputValue) - (inputValue) * 0.1) ;

  })
  


});