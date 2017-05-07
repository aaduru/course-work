const DOMNodeCollection = require("./dom_node_collection");

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
