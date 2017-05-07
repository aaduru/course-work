const APIUtil = {
  followUser(id) {
    // ...
    return $.ajax({
      url: `/users/${id}/follow`,
      method: 'POST',
      dataType: 'JSON'
      // success: success

    });
  },

  unfollowUser(id) {
    // ...
    return $.ajax({
      url: `/users/${id}/follow`,
      method: 'DELETE',
      dataType: 'JSON'
      // success: success
    });
  },

  searchUsers(queryVal) {
    return $.ajax({
      url: `/users/search/?query=${queryVal}`,
      method: 'GET',
      dataType: 'JSON'
    });

  }
};

module.exports = APIUtil;
