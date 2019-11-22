import React from 'react';

export default function User({ id, first_name, last_name }) {
  return (
    <tr>
      <td>{id + 1}</td>
      <td>{first_name}</td>
      <td>{last_name}</td>
    </tr>
  );
}
