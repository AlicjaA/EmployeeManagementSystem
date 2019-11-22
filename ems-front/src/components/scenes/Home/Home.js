import React, { useState, useEffect } from 'react';
import User from './User';
import Pagination from './Pagination';
import usersData from '../../../data/users';

export default function Home() {
  const [users, setUsers] = useState([]);
  useEffect(() => {
    setUsers(usersData);
  }, []);

  return (
    <div className="container pt-4">
      <div className="row">
        <div className="col-12 col-lg-6 mb-4">
          <div className="p-4 bg-white rounded shadow">
            <h4>Employees</h4>
            <table className="table table-bordered table-striped">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">First name</th>
                  <th scope="col">Last name</th>
                </tr>
              </thead>
              <tbody>
                {users.map((user) => <User key={user.id} {...user} />)}
              </tbody>
            </table>
            <Pagination />
          </div>
        </div>
        <div className="col-12 col-lg-6 mb-4">
          <div className="p-4 bg-white rounded shadow">
            <h4>Agencies</h4>
          </div>
        </div>
      </div>
    </div>
  );
}
