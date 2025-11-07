const app = require('express')();

app.get('/', (req, res) => {
  res.json({ msg: 'Hello World! krish' });
});

app.get('/health', (req, res) => {
  res.json({ status: 'OK' });
});

app.listen(3000, _ => console.log(`Example app listening at http://localhost:3000`));