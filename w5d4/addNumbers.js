const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum = 0, numsLeft, completionCallback){
  let num = 0;
  if(numsLeft>0){
    reader.question('Enter the number', (res) => {
      num = parseInt(res);
      sum += num;
      completionCallback(sum);
      numsLeft --;
      addNumbers(sum, numsLeft ,completionCallback);


    });
  }
  else if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();

  }
}


addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
