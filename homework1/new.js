

let buildUrl = require('build-url');
let adr = buildUrl('https://uinames.com/api/', {
  queryParams: {
    gender: 'female',
    region: 'germany'
  }
});
var url = require('url');
console.log(adr);
var q = url.parse(adr, true);
var qdata = q.query;

var options = {
        host : 'uinames.com',
        path:  'https://uinames.com/api/?region=germany&gender=female',
        json: true
    };

const https = require('https');

https.get(options, (resp) => {
    let data = '';

  // A chunk of data has been recieved.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => {
    console.log(data);
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
});
