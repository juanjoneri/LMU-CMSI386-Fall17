const {
  change, stripQuotes, scramble, say, powers, interleave,
  powersGenerator, cylinder, makeCryptoFunctions, randomName,
} = require('./src/warmup.js');

randomName({ gender: 'jamon', region: 'argentina' }).then((name) => {
  console.log(name);
}, (err) => {
    console.error(err);
});

let done = function (thing) {
    console.log(thing);
}

randomName({ gender: 'fefwefemale', region: 'canada' }).catch((error) => {
  console.log(error.message);
}).then(done, done);
