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
