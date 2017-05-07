const Board = require('./board');
const Coord = require('./coord');

class View {
  constructor($el) {
    this.board = new Board();
    this.$el = $el;
    this.eventBinders();
    this.setupBoard();
    setInterval(this.step.bind(this), 500);
  }

  step() {
    this.board.snake.move();
    this.render();
  }

  setupBoard() {
    for (var i = 0; i < 20; i++) {
      let $ul = $('<ul></ul>');
      $ul.data('row', i);
      this.$el.append($ul);
      for (var j = 0; j < 20; j++) {
        let $li = $('<li></li>');
        $li.data('col', j);

        $ul.append($li);
      }
    }
  }

  render() {
    $('li').removeClass('.segment');
    this.board.snake.segments.forEach((segment) => {
      let $ul = $(`ul[data-row='${segment.coord[0]}']`);
      let $li = $ul.find(`li[data-col='${segment.coord[1]}']`);
      $li.addClass('.segment');
    });
  }

  eventBinders() {
    $(document).keydown((event) => {
      let key = event.key;
      if (key === "ArrowDown") {
        this.board.snake.turn("S");
      } else if (key === "ArrowUp") {
        this.board.snake.turn("N");
      } else if (key === "ArrowLeft") {
        this.board.snake.turn("W");
      } else if (key === "ArrowRight") {
        this.board.snake.turn("E");
      }
    });
  }


}

module.exports = View;
