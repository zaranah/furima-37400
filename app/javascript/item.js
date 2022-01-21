function calculate (){
  const priceText  = document.getElementById("item-price");
  priceText.addEventListener("keyup", () => {
    const priceValue = priceText.value;
    const taxPriceID  = document.getElementById("add-tax-price");
    const taxPrice = Math.floor(priceValue*0.1);
    const profitId  = document.getElementById("profit");
    const profit = priceValue - taxPrice;
    if (priceValue >= 10){
    taxPriceID.innerHTML = `${taxPrice}`;
    profitId.innerHTML = `${profit}`;
    }
    else{
      taxPriceID.innerHTML = `${0}`;
      profitId.innerHTML = `${priceValue}`;
    }
  });
};

window.addEventListener('load', calculate);
