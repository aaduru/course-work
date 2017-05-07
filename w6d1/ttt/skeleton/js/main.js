const View = require('./ttt-view');
const Game = require('./solution/game');

$( () => {
  let $ttt = $('.ttt');
  let view = new View(new Game(), $ttt);
});
