const express = require("express");
const app = express();
const port = 3000;
const connection = require("./db");

app.use(express.json());
//pulse check
app.post("/books", (req, res) => {
  console.log("req.body", req.body);
  const { title, author, published_at, price } = req.body;

  const query = `INSERT INTO books (title,author,published_at,price) VALUES (?,?,?,?)`;
  // console.log("arr", arr);

  const arr = [title, author, published_at, price];
  // console.log("arr", arr);
  connection.query(query, arr, (err, results) => {
    res.json(results);
  });
});

app.get("/books", (req, res) => {
  const query = `SELECT * FROM books`;

  connection.query(query, (err, results) => {
    res.json(results);
  });
});

//practice

app.put("/books/:book_id", (req, res) => {
  const book_id = req.params.book_id;
  console.log("book_id", book_id);

  const query = `UPDATE books SET title = ? where id = ?`;

  const arr = [req.body.title, book_id];

  connection.query(query, arr, (err, results) => {
    res.json(results);
  });
});

app.delete("/books/:book_id", (req, res) => {
  const book_id = req.params.book_id;
  console.log("book_id", book_id);

  const query = `delete from books where id = ?`;

  const arr = [book_id];

  connection.query(query, arr, (err, results) => {
    res.json(results);
  });
});

app.get("/te", (req, res) => {
  const query = `select * from books ORDER BY id DESC`;

  connection.query(query, (err, results) => {
    console.log("results", results);
    res.json(results);
  });
});

app.post("/null", (req, res) => {
  console.log("req.body", req.body);
  const { title, author, published_at, price } = req.body;

  const query = `INSERT INTO books (title,author,published_at) VALUES (?,?,?)`;
  // console.log("arr", arr);

  const arr = [title, author, published_at];
  // console.log("arr", arr);
  connection.query(query, arr, (err, results) => {
    res.json(results);
  });
});

//4+5
//select * from books where price IS  NULL;
//select * from books where price IS NOT NULL;

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
