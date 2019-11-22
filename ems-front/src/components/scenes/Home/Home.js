import React from 'react';
import { Link } from 'react-router-dom';
import { Button } from 'reactstrap';

export default function Home() {
  return (
    <>
        <Link to="/">Home</Link>
        
        <Button color="danger">Danger!</Button>
    </>
  );
}
