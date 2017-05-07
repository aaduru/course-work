function twoSum(array){
  let result = [];

  for(let i = 0; i < array.length - 1; i++){
    for(let j = i + 1; j < array.length; j++){
      if (array[i] + array[j] === 0){
        result.push([i, j]);
      }
    }
  }

  // console.log(result);
  return result;
}

console.log(twoSum([-1,0,2,-2,1]));
