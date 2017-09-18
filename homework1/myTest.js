const {
  change, stripQuotes, scramble, say, powers, interleave,
  powersGenerator, cylinder, makeCryptoFunctions, randomName,
} = require('./src/warmup.js');

promise = randomName({ gender: 'femalea', region: 'france' });
promise.then(console.log).catch((err) => {console.log(err.message + " this is tit")});
