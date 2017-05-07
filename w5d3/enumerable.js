// Array.prototype.myEach = function (cb) {
//   for(let i = 0; i < this.length; i++){
//     cb(this[i]);
//   }
// };
//
// Array.prototype.myMap = function (cb){
//   let newArray = [];
//   this.myEach(el => newArray.push(cb(el)));
//   return newArray;
// };

// [1,2,3,4,5].myMap(el => {
//   if (el % 2 === 0) {
//     return el + 1;
//   } else {
//     return el;
//   }
//
// });

// Monkey patching
// we are adding the myeach prototype to the array class
// this is similar to self in ruby
// this.length is equal to self.length
// cb i s a call back function, similar to proc in ruby.
 // here the function is called fo every single element of the Array
Array.prototype.myEach = function (cb){
  for(let i = 0; i < this.length; i++){
    cb(this[i]);
  }
};

// [1,2,3,4,5].myEach(el => console.log(el));

Array.prototype.myMap = function (cb){
  let newArray = [];
  this.myEach(el => newArray.push(cb(el)));
  return newArray;
};


// console.log([1,2,4,6,7].myMap(el => el * el / (el * el * el)));


// Array.prototype.mySelect = function (cb){
//   let newArray = [];
//   this.myEach(el => {
//     if (cb(el)){
//       newArray.push(el);
//     }
//     // else {
//     //   continue;
//     // }
//   });
//   return newArray;
// };





Array.prototype.mySelect = function(cb) {
  let result = [];
  this.myEach(el => {
    if(cb(el)){
      result.push(el);
    }
  });
  return result;
};
// in js === check equality between two elements/objects
// !== is equivalent to not equal to
// console.log([1,2,3,4,5,6].mySelect(el => el % 3 === 0));

Array.prototype.myInject = function (cb) {
  // let acc = 0;
  let acc = this[0];
    // accumulator is initialized to the first element of the array
  this.slice(1).myEach(el => {
    //splice will modified the array
    //slice will not modiried the array
    // we use slice here as the first element is already assigned to the acc

    acc = cb(el, acc);
    // assign the value of callback function to the accumulator
    // which takes two args acc and the element
    // the order of passing args should match the calling block

  });
  return acc;
};

console.log([1,3,3].myInject((el, ac) => ac - el));
console.log(["a","b", "c", "d"].myInject((el, ac) => ac + el));


// > [1, 3, 4, 5, 7, 11, 22, 33, 44, 55, 71].sort((a, b) => a - b)
// [ 1, 3, 4, 5, 7, 11, 22, 33, 44, 55, 71 ]
// > [1, 3, 4, 5, 7, 11, 22, 33, 44, 55, 71].sort((a, b) => b - a)
// [ 71, 55, 44, 33, 22, 11, 7, 5, 4, 3, 1 ]
