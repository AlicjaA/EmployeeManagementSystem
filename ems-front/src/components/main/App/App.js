import React from 'react';
import {
  Route,
  Switch,
  BrowserRouter,
} from 'react-router-dom';
import Home from '../../scenes/Home';
import Header from '../Header';
import '../../../assets/scss/index.scss';

function App() {
  return (
    <BrowserRouter>
      <Header />
      <Switch>
        <Route exact path="/" component={Home} />
      </Switch>
    </BrowserRouter>
  );
}

export default App;
