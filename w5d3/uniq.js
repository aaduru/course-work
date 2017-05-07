// function uniq(array){
//   array.sort((a, b) => a - b);
//   let result = [array[0]];
//
//   for(let i = 1; i < array.length; i++){
//     if(array[i - 1] === array[i]){
//       continue;
//     }
//     else{
//       result.push(array[i]);
//     }
//   }
//   console.log(result);
//   return result;
// }


function uniq(array){
  let result = [];

  for(let i = 0; i < array.length; i++){
    if(result.includes(array[i])){
      continue;
    }
    else {
      result.push(array[i]);
    }
  }
  console.log(result);
  return result;
}

uniq([1, 2, 1, 3, 3]);
