// console.log("It's working");
let Router = require("./router");



document.addEventListener("DOMContentLoaded", () => {
  const content = document.querySelector(".content");
  const router = new Router(content);
  router.start();
  const items = Array.from(document.querySelectorAll(".sidebar-nav li"));
  items.forEach((el) => {
    el.addEventListener("click", () => {
      let newLoc = el.innerText.toLowerCase();
      window.location.hash = newLoc;
    });
  });
});
