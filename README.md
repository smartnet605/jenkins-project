# SpringCT  Project

<h2>Update the Database Values</h2>

- Create following table in db.

<pre> CREATE TABLE users (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL
);
</pre>

- Change db values with your db details in following file.

<pre>config/database.js </pre>

<h2>Install node modules</h2>

<pre>npm install </pre>

<h2>Start the server</h2>
<pre>node server.js</pre>

<h2>Check server</h2>

<h4>http://localhost:3000</h4>

- Click on register and fill the username and password.

- After register click on login .

- Use username and password to login.
