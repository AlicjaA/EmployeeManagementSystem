import React from 'react';

export default function Agency({ id, name }) {
  return (
    <tr>
      <td>{id}</td>
      <td>{name}</td>
    </tr>
  );
}
