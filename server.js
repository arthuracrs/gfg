'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

let count = 0
// App
const app = express();
app.get('/', (req, res) => {
    
    res.send(`Hello World, count: ${count}`);
});

app.get('/health', (req, res) => {
    count++
    res.send('ok');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
