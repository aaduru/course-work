function uniq(array){
  const newArray = [];
  for(let i = 0; i<array.length; i++){
    if(newArray.includes(array[i])){
      continue;
    }
    else {
      newArray.push(array[i]);
    }
  }
  return newArray;
}

// console.log(uniq([1,1,2,2,3,4]));

function myTranspose (array){
  let transposeArray = [];
  let rowLength = array.length;
  let columnLength = array[0].length;
  for(let i = 0; i<columnLength; i++){
    transposeArray[i] = [];
    for(let j=0; j<rowLength; j++){
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
