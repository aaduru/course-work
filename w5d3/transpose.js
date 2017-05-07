// function transpose(arr){
//   let result = [];
//
//   for(let col = 0; col < arr[0].length; col++){
//     let cur = [];
//     for(let row = 0; row < arr.length; row++){
//       cur.push(arr[row][col]);
//     }
//     result.push(cur);
//   }
//   return result;
// }


function myTranspose(array){
  const transposeArray = [] ;
  for(let i =0;i<array[0].length;i++){
    transposeArray[i] = [];
    for(let j = 0; j< array.length; j++){
      transposeArray[i][j] = array[j][i];
    }
  }
  return transposeArray;
}

console.log(myTranspose([
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
]));
