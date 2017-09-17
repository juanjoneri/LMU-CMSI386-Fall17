const {
  change, stripQuotes, scramble, say, powers, interleave,
  powersGenerator, cylinder, makeCryptoFunctions, randomName,
} = require('./src/warmup.js');

randomName({ gender: 'jamon', region: 'argentina' }).then((name) => {
  console.log(name);
}, (err) => {
    console.error(err);
});
