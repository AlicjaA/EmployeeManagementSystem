import React from 'react';
import {  
  Route, 
  Switch, 
  BrowserRouter, 
} from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';
import Home from '../../scenes/Home';

function App() {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={Home} />
      </Switch>
    </BrowserRouter>
  );
}

export default App;
