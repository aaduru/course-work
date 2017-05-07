const toggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$ (() => {
  const toggleButton = $('button.follow-toggle');
  toggleButton.each((index, element) => {
    new toggle(element);
  });

  const userSearch = $('nav.users-search');
  userSearch.each((index, element) => {
    new UsersSearch(element);
  });
});
