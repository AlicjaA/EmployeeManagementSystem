import React from 'react';

export default function Home() {
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
              <tbody></tbody>
            </table>
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
