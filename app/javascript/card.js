const { formDisableSelector } = require("@rails/ujs");

const pay = () => {
  Payjp.setPublicKey("pk_test_e02b0b822828dad121a5ea64");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault ();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
    number: formData.get("order_address[number]"),
    cvc: formData.get("order_address[cvc]"),
    exp_month: formData.get("order_address[month]"),
    exp_year: `20${formData.get("order_address[year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        console.log(status)
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type='hidden' >`;
        renderDom.insertAdjacentHTML("beforeend",tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};
addEventListener("load", pay);