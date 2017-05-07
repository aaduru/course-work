// function bubbleSort(array){
//   for(let i = 0 ; i < array.length-1; i++){
//     for(let j = i+1; j < array.length; j++){
//       if (array[i] > array[j] ){
//         let tmp = array[i];
//         array[i] = array[j];
//         array[j] = tmp;
//       }
//     }
//   }
//   return array;
// }



function bubbleSort(array){
  for(let i = 0; i < array.length - 1; i++){
    for(let j = 0; j < array.length - 1 - i; j++){
      if(array[j] > array[j + 1]){
        let tmp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = tmp;
      }
    }
  }
  return array;
}


// console.log(bubbleSort([9, 8, 7, 6, 5, 4, 3, 2, 1]));
//
// function subStrings(string){
//   let result = [];
//   for(let i = 0; i < string.length; i++){
//     for(let j = i; j < string.length; j++){
//       // console.log(i);
//       // console.log(j);
//       // console.log(string.substring(i, j + 1));
//       result.push(string.substring(i, j + 1));
//     }
//   }
//   return result;
// }


function subStrings(string){
  let result = [];
  for(let i = 0; i <string.length; i++){
    for(let j = i; j < string.length; j++){
      result.push(string.substring(i,j+1));
    }
  }
  return result;
}
console.log(subStrings("cat"));
