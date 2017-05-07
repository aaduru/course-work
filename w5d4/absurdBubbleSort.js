const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  let answer;
  reader.question(`Is ${el1} greater than ${el2}?`, (res) => {
    answer = res;
    if (answer === "yes"){
      callback(true);
    }
    else {
      callback(false);

    }
  });}

  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.

//
// askIfGreaterThan(5,3,((x) => console.log(x)));
// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.

  if (i === arr.length - 1 ){
    outerBubbleSortLoop(madeAnySwaps);

  }
  else  {
    askIfGreaterThan(arr[i],arr[i+1],function makeSwap(x){
      if (x){
        let tmp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = tmp ;
        madeAnySwaps = true;
        console.log(x);
        console.log(madeAnySwaps);
        console.log(arr);
        console.log(i);
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
      }
      else {
        // madeAnySwaps = false ;
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);

      }

    });

  }


}

// innerBubbleSortLoop([1,2,5,4,3],0, false, () => console.log("outerBubbleSortLoop") );


// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  outerBubbleSortLoop(true);
  function outerBubbleSortLoop(madeAnySwaps) {
    if(madeAnySwaps){
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);

    }
    else {
      sortCompletionCallback(arr);
    }

    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 7, 5,1,6,4], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
