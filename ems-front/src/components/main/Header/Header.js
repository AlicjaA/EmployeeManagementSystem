import React, { useState } from 'react';
import {
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
import NavLink from './NavLink';

export default function Header() {
  const [isOpen, setIsOpen] = useState(false);
  return (
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
  )
}
