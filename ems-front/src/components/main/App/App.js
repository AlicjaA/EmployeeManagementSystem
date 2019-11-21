import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Home from '../../scenes/Home';
import 'bootstrap/dist/css/bootstrap.css';

function App() {
  return (
    <Switch>
      <Route exact path="/" component={Home} />
    </Switch>
  );
}

export default App;
