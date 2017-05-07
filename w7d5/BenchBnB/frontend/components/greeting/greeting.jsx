import React from 'react';
import { Link } from 'react-router';

const notloggedInLinks = () => (
  <div>
    <Link to="/login" activeClassName="current">Login</Link>
    <Link to="/signup" activeClassName="current">Sign up!</Link>
  </div>
);

const loggedInGreeting = (currentUser, logout) => (
	<div>
    <h2> Hi, {currentUser.username}!</h2>
    <button onClick={logout}>Log Out</button>
	</div>
);

const Greeting = ({ currentUser, logout }) => (
  currentUser ? loggedInGreeting(currentUser, logout) : notloggedInLinks()
);

export default Greeting;
