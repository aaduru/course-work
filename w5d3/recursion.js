function range(start, end) {
  if (start > end) { return []; }
  let arr = range(start, end-1);
  arr.push(end);
  return arr;
}

// console.log(range(0, 5));
// console.log(range(1, 3));


function sumOfArray_r(array){
  if (array.length === 0){
    return 0;
  }
  if (array.length === 1 ){
    return array[0];
  }
  return array[array.length - 1] + sumOfArray_r(array.slice(0, array.length - 1));
}

// console.log(sumOfArray_r([1, 2, 3, 4]));
function exp(base, number) {
  if (number === 0){
    return 1 ;
  }
  return base * exp(base, number - 1);
}

// console.log(exp(2,4));

function exp2(base,number){
  if (number === 0){
    return 1;
  }
  if (number === 1){
    return base;
  }
  if (number % 2 === 0){
    return Math.pow(exp2(base, Math.floor(number / 2)), 2);
  }

  if (number % 2 === 1){
    return base * Math.pow(exp2(base, Math.floor(number / 2)), 2);
  }
}

// console.log(exp2(2, 11));

function fibonacci(num){
  if (num === 0){
    return [];
  }
  if (num === 1){
    return [1];
  }
  if(num === 2){
    return [1, 1];
  }
  let fib = fibonacci(num - 1);
  return fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
}

console.log(fibonacci(5));
