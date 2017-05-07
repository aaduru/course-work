class Router {

  constructor(node){
    this.node = node;

  }

  start(){
    this.render();
    window.addEventListener("hashchange", () => {
      this.render();
    });
  }

  render(){
    this.node.innerHTML = "";
    let currentRoute = this.activeRoute();
    let p = document.createElement("P");

    p.innerHTML = currentRoute;
    console.log(p);
    console.log(currentRoute);
    console.log(this.node);
    if(currentRoute) {
      this.node.appendChild(p);
    }
  }

  activeRoute(){
    let hashFragment = window.location.hash;
    return hashFragment.substr(1);

  }

}

module.exports = Router;
