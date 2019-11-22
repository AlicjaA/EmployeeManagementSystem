import React, { useState } from 'react';
import {  
  Route, 
  Switch, 
  BrowserRouter,
  Link,
} from 'react-router-dom';
import { 
  Navbar,
  Nav,
  NavbarBrand,
  NavItem,
  Collapse,
  NavbarToggler,
} from 'reactstrap';
import NavLink from '../App/NavLink/NavLink';
import 'bootstrap/dist/css/bootstrap.css';
import Home from '../../scenes/Home';

function App() {
  const [isOpen, setIsOpen] = useState(false);
  return (
    <BrowserRouter>
      <Navbar color="light" light expand="md">
        <NavbarBrand>
          <Link to="/">EMS</Link>
        </NavbarBrand>
        <NavbarToggler onClick={() => setIsOpen(!isOpen)} />
        <Collapse isOpen={isOpen} navbar>
        <Nav className="mr-auto" navbar>
          <NavItem>
           <NavLink exact to="/aaa">AAA</NavLink>
          </NavItem>
          <NavItem>
           <NavLink exact to="/bbb">BBB</NavLink>
          </NavItem>
          <NavItem>
           <NavLink exact to="/ccc">CCC</NavLink>
          </NavItem>
        </Nav>
        </Collapse>
      </Navbar>

      <Switch>
        <Route exact path="/" component={Home} />
      </Switch>
    </BrowserRouter>
  );
}

export default App;