const HanoiGame = require('./towersOfHanoi');
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const completionCallback = function(){

  reader.question("Do you want to play again?", (res) =>
    {if(res ==="y"){
    game.run(completionCallback);
    } else {
    console.log("game over");
    reader.close();

}
});};

const game = new HanoiGame();
game.run(completionCallback);
