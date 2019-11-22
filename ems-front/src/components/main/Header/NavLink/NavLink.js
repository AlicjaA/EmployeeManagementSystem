import React from 'react';
import { NavLink as RouterNavLink } from 'react-router-dom';
import { NavLink as ReactStrapNavLink } from 'reactstrap';

export default function NavLink(props) {
  const { children } = props;
  return (
    <ReactStrapNavLink tag={RouterNavLink} {...props}>
      {children}
    </ReactStrapNavLink>
  );
}