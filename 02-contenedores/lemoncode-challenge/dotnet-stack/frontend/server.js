//Módulos
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const express = require('express');
    app = express();

const server = process.env.API_URI || 'http://localhost:5000';
const topicsEndPoint = `${server}/api/topics`;

app.set('view engine', 'ejs');

app.get('/', async (req, res) => {

    //Recuperar topics de la API
    const response = await fetch(topicsEndPoint);
    const topics = await response.json();

    res.render('index', { topics });

});

app.listen(3000, () => {
    console.log(`Server running on port 3000 with ${topicsEndPoint}`);
});