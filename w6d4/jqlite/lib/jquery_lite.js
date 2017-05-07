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

	const DOMNodeCollection = __webpack_require__(1);

	const $l = arg => {
	  if( typeof(arg) === "string"){
	    return getNode(arg);
	  }
	  if ( arg instanceof HTMLElement){
	    return new DOMNodeCollection([arg]);
	  }
	};

	const getNode = value => {
	  const nodes = document.querySelectorAll(value);
	  const nodesArray = Array.from(nodes);
	  return new DOMNodeCollection(nodesArray);
	};


	window.$l = $l;


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DomNodeCollection {
	  constructor (nodes){
	    this.nodes = nodes;
	  }

	  html(string){
	    if (typeof(string) === "string" ){
	      this.each(el => (el.innerHTML = string));
	    }
	    else {
	      if (this.nodes.length > 0){
	        return this.nodes[0].innerHTML;
	      }
	    }

	  }

	  empty(){
	    this.html('');
	  }

	  append(node){
	    if (typeof(node) === 'string'){
	      this.each(el => (el.innerHTML += node));
	    }

	  }

	  attr(key, value) {
	    if (typeof value === "string") {
	      this.each( node => node.setAttribute(key, value) );
	    }
	    else {
	      return this.nodes[0].getAttribute(key);
	    }
	  }

	  addClass(value){
	    this.each(el => (el.classlist.add(value)));
	  }

	  removeClass(value){
	    this.each(el => (el.classlist.remove(value)));
	  }

	  childern(){
	    let childNodes = [];
	    this.each(el => {
	      const nodeList = el.childern;
	      const nodeListArray = Array.from(nodeList);
	      childNodes = childNodes.concat(nodeListArray);
	    });
	    return new DomNodeCollection(childNodes);
	  }

	  // The Node.parentNode read-only property returns the parent of the specified node in the DOM tree.
	  parent() {
	     const parentNodes = [];
	     this.each(el => parentNodes.push(el.parentNode));
	     return new DomNodeCollection(parentNodes);
	   }

	  find(value){
	    const found = [];
	    this.each(el => {
	      let list = el.querySelectorAll(value);
	      let array = Array.from(list);
	      found = found.concat(array);
	    });
	    return new DomNodeCollection(found);
	  }

	  remove() {
	    this.each(el => el.parentNode.removeChild(el));
	  }

	  on(eventName, callback) {
	    this.each(el => {
	      el.addEventListener(eventName, callback);
	      const eventKey = `jqliteEvents-${eventName}`;
	      if (typeof el[eventKey] === "undefined") {
	        el[eventKey] = [];
	      }
	      el[eventKey].push(callback);
	    });
	  }

	  off(eventName) {
	    this.each(node => {
	      const eventKey = `jqliteEvents-${eventName}`;
	      if (node[eventKey]) {
	        node[eventKey].forEach(callback => {
	          node.removeEventListener(eventName, callback);
	        });
	      }
	      node[eventKey] = [];
	    });
	  }

	}




	module.exports = DomNodeCollection;


/***/ }
/******/ ]);