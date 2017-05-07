class HanoiView{
  constructor(game, $el){
    this.game = game;
    this.from = undefined;
    this.to = undefined;
    this.$el = $el;
    this.setupTowers();
    this.clickTower();
  }
  setupTowers(){
    this.$el.append('<ul></ul>');
    for (var i = 0; i < 3; i++) {
      let $li = $('<li></li>');
      $li.data('tower', i);
      $('ul').append($li);
      if (i === 0){
        let $divBig = $("<div class='big'></div>");
        let $divMedium = $("<div class='medium'></div>");
        let $divSmall = $("<div class='small'></div>");
        $li.append($divSmall);
        $li.append($divMedium);
        $li.append($divBig);
      }
    }

  }
  clickTower(){
    let $li1, $li2;
    $('li').click((event) => {
      if (this.from === undefined){
        $li1 = event.currentTarget;
        this.from = $($li1).data('tower');
      }
      else
      {
        $li2 = event.currentTarget;
        this.to = $($li2).data('tower');
        if (!this.game.isValidMove(this.from, this.to)){
          alert('invalid move');
        }else {
          this.game.move(this.from, this.to);
          this.render($li1, $li2);
        }
        if (this.game.isWon()){
          $('h2').append('you win');
        }
        this.from = undefined;
        this.to = undefined;
      }
    });
  }

  render(from, to){
    let $li1 = $(from);
    let $li2 = $(to);
    let $fromDiv = $li1.children().first();
    $fromDiv.remove();
    $li2.prepend($fromDiv);

  }
}

module.exports = HanoiView;
