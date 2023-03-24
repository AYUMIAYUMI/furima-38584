document.addEventListener('turbolinks:load', () => {
  alert("item")
})

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {

    const addTaxDom = document.getElementById("add-tax-price");
     console.log(priceInput.innerHTML);
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    const addPofitDom = document.getElementById("profit");
    // console.log(priceInput.innerHTML);
    addPofitDom.innerHTML = Math.floor(priceInput.value - Math.round(priceInput.value * 0.1 ))

 })
});