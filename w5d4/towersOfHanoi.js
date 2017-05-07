const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
class HanoiGame {
  constructor() {
    this.towers = [[3,2,1], [], []];

    // this.tower1 = [3,2,1];
    // this.tower2 = [];
    // this.tower3 = [];
  }

  promptMove(callback) {
    // console.log(this.towers[0]);
    // console.log(this.towers[1]);
    // console.log(this.towers[2]);
    let answer;
    let startTowerIdx;
    let endTowerIdx;
    reader.question("Which tower do you want to take from and insert into e.g. 1,2" , res => {
      answer = res.split(",");
      startTowerIdx = parseInt(answer[0]);
      endTowerIdx = parseInt(answer[1]);
      callback(startTowerIdx, endTowerIdx);
      // console.log("in promptmove");
      // this.print();
      // console.log(this.isValidMove(startTowerIdx, endTowerIdx));
      // // console.log(this.towers[startTowerIdx], this.towers[endTowerIdx]);
      // console.log(this.move(startTowerIdx,endTowerIdx));
      // this.print();
    });
  }

  isValidMove(startIdx, endIdx){
    let start = this.towers[startIdx];
    let end = this.towers[endIdx];
    // console.log("in validmove");


    if(start.length === 0) {

      return false;

    }
    else if (end.length === 0){

      return true;
    }
    else if (end[end.length-1] > start[start.length-1] ){

      return true;
    }
    else {
      return false;
    }
  }

  move(start,end){
    // console.log("in move");
    if (this.isValidMove(start,end)){
      let startt = this.towers[start];
      let endt = this.towers[end];
      endt.push(startt.pop(1));
      return true;
    }

    else {
      return false;
    }
  }

  print() {
    console.log(JSON.stringify(this.towers));
  }

  isWon(){
    if (this.towers[2].length ===3  || this.towers[1].length === 3 ){
      return true ;
    }
    else {
      return false;
    }
  }

  run(completionCallback) {
    this.print();
      this.promptMove((start,end)=>{
        if(this.move(start,end)){
          if(this.isWon()){
            completionCallback();
          }
          else {
            this.run(completionCallback);
          }
        } else
        { console.log("Invalid Move");
        this.run(completionCallback);
        }
    });
    //
    //run it until tower 2 or tower 3 is full
    // get from tower from player
    // check if from tower has pieces
    // if valid store the top piece size
    // get the to tower from the player
    //  check if top piece can be moved top to to tower
    // if valid movie piece from from tower to to tower
  }
}


module.exports = HanoiGame;
