const urlBuilder = require('build-url');
const https = require('https');


let adr = urlBuilder('https://uinames.com/api/', {
  queryParams: {
    gender: 'salame',
    region: 'germany',
    amount: '1'
  }
});

let options = {
        host : 'uinames.com',
        path:  adr,
        json: true
};

https.get(options, (resp) => {
    let data = '';

    resp.on('data', (chunk) => { data += chunk; });

    resp.on('end', () => {
        let person = JSON.parse(data);
        person.error !== undefined ? console.log("no functiona") : console.log("funciona");

    });

}).on("error", (err) => {
    //console.log(err.message);
});
