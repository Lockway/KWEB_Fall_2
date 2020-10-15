const http = require('http');
const axios = require('axios');

const hostname = '127.0.0.1';
const port = 3000;

let msg={
    stargazers_count:0,
    forks_count:0,
    open_issues_count:0
};

axios.get('https://api.github.com/repos/nodejs/node').then(resp => {
    msg=resp.data;
});

const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');

    try{
        res.end(`Stargazers: ${msg.stargazers_count}\nForks: ${msg.forks_count}\nOpen Issues: ${msg.open_issues_count}`);
    }catch(e){
        res.statusCode=500;
        console.log('Internal error issued.\n');
        console.log(e);
    }
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});