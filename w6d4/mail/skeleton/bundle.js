/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	// console.log("It's working");
	let Router = __webpack_require__(1);



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


/***/ },
/* 1 */
/***/ function(module, exports) {

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


/***/ }
/******/ ]);