import React, { Component } from 'react';
import { NavLink as RouterNavLink } from 'react-router-dom';
import { NavLink as ReactStrapNavLink } from 'reactstrap';

export default class NavLink extends Component {
  render() {
    return (
      <ReactStrapNavLink tag={RouterNavLink} {...this.props}>
        {this.props.children}
      </ReactStrapNavLink>
    );
  }
}