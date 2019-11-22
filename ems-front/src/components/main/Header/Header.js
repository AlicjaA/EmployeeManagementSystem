import React, { useState } from 'react';
import {
  Navbar,
  Nav,
  NavbarBrand,
  NavItem,
  Collapse,
  NavbarToggler,
  DropdownMenu,
  DropdownItem,
  DropdownToggle,
  UncontrolledDropdown,
} from 'reactstrap';
import {
  faGlobe,
  faUsers,
  faBriefcase,
  faBell,
  faPowerOff,
} from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import NavLink from './NavLink';

export default function Header() {
  const [isOpen, setIsOpen] = useState(false);
  return (
    <Navbar color="light" light expand="md">
      <NavbarBrand>EMS</NavbarBrand>
      <NavbarToggler onClick={() => setIsOpen(!isOpen)} />
      <Collapse isOpen={isOpen} navbar>
        <Nav className="mr-auto" navbar>
          <NavItem>
            <NavLink exact to="/">
              <FontAwesomeIcon icon={faGlobe} className="mr-1" /> Dashboard
            </NavLink>
          </NavItem>
          <NavItem>
            <NavLink exact to="/bbb">
              <FontAwesomeIcon icon={faUsers} className="mr-1" /> Employees
            </NavLink>
          </NavItem>
          <NavItem>
            <NavLink exact to="/ccc">
              <FontAwesomeIcon icon={faBriefcase} className="mr-1" /> Agencies
            </NavLink>
          </NavItem>
        </Nav>
        <Nav navbar className="ml-auto">
          <NavItem>
            <NavLink to="/notifications">
              <FontAwesomeIcon icon={faBell} />
            </NavLink>
          </NavItem>
          <UncontrolledDropdown nav inNavbar>
            <DropdownToggle nav caret>
              John Smith
            </DropdownToggle>
            <DropdownMenu right>
              <div className="p-3">
                <div>
                  John Smith
                </div>
                <div>
                  <span className="badge badge-dark">Administrator</span>
                </div>
              </div>
              <DropdownItem divider />
              <DropdownItem>
                <FontAwesomeIcon icon={faPowerOff} />
                <span className="ml-2">Sign Out</span>
              </DropdownItem>
            </DropdownMenu>
          </UncontrolledDropdown>
        </Nav>
      </Collapse>
    </Navbar>
  );
}
