const express = require('express');
const path = require('path');
const port = process.env.PORT || 3000;
const app = express();


// server.js or index.js
console.log('Environment Variables:');
console.log(`REACT_APP_API_BASE_URL: ${process.env.REACT_APP_API_BASE_URL}`);
console.log(`REACT_APP_AUTHENTICATION_SERVICE_URL: ${process.env.REACT_APP_AUTHENTICATION_SERVICE_URL}`);
console.log(`REACT_APP_COMMON_DATA_SERVICE_URL: ${process.env.REACT_APP_COMMON_DATA_SERVICE_URL}`);
console.log(`REACT_APP_PAYMENT_SERVICE_URL: ${process.env.REACT_APP_PAYMENT_SERVICE_URL}`);
console.log(`REACT_APP_SEARCH_SUGGESTION_SERVICE_URL: ${process.env.REACT_APP_SEARCH_SUGGESTION_SERVICE_URL}`);
console.log(`REACT_APP_ENVIRONMENT: ${process.env.REACT_APP_ENVIRONMENT}`);




// the __dirname is the current directory from where the script is running
app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname, 'build')));
app.get('/ping', function (req, res) {
    return res.send('pong');
});
app.get('/*', function (req, res) {
    res.sendFile(path.join(__dirname, 'build', 'index.html'));
});
app.listen(port);
