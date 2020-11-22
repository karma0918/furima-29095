console.log("ok")
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  priceInput.addEventListener( "input", ()=>{
    const inputValue = priceInput.value;
    tax.innerHTML = Math.ceil(inputValue*0.1);
    Profit.innerHTML = Math.floor(inputValue*0.9);

  });
});