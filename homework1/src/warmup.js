
/**
 * A function that accepts a number of U.S. cents and returns an array containing,
 * respectively, the smallest number of U.S. quarters, dimes, nickels, and pennies
 * that equal the given amount.
 */
exports.change = function(cents) {
    if (cents < 0) { throw new RangeError(); }

    let ans = [0, 0, 0, 0];

    let i = 0;
    [25, 10, 5, 1].forEach(function(coin) {
        ans[i] = Math.floor(cents / coin);
        cents -= ans[i]*coin;
        i++;
    });
    return ans;
};

/**
 * A function that accepts a string and returns a new string equivalent to the
 *  argument but with all apostrophes and double quotes removed.
 */
exports.stripQuotes = function(str) {
    return str.replace(/["'\\]/g, '');
}

/**
 * A function that randomly permutes a string.
 * What does random mean? It means that each time you call the function for a given argument,
 * all possible permutations are equally likely. Random is not the same as arbitrary.
 */
exports.scramble = function(str) {
    const MAX_N_SWAPS = 100;
    const N_SWAPS = Math.floor(Math.random() * MAX_N_SWAPS);
    const STR_LEN = str.length;

    for (let i = 0; i < N_SWAPS; ++i) {
        let pos1 = Math.floor(Math.random() * STR_LEN);
        let pos2 = Math.floor(Math.random() * STR_LEN);
        let char1 = str[pos1];
        let char2 = str[pos2];
        str = str.replace(str[pos1], char2);
        str = str.replace(str[pos2], char1);
    }

    return str;
}

/**
 * A function that yields successive powers of a base starting
 * at 1 and going up to some limit. Consume the values with a callback.
 */
exports.powers = function(base, max, fun) {
    let pow = 1;

    while (pow <= max) {
        fun(pow);
        pow *= base;
    }
}

/**
 * A JavaScript generator function that yields successive powers of a
 * base starting at 1 and going up to some limit.
 */
exports.powersGenerator = function*(base, max) {
    let [a, b] = [1, 1];
    while (b <= max) {
        a = b;
        b = a*base;
        yield a;
    }
}
/**
 * A “chainable” function that accepts one string per call, but when called without arguments,
 * returns the words previously passed, in order, separated by a single space.
 */

exports.say = function(str) {
    if (str === undefined) { return ''; }

    let addWord = function(newWord) {
        if (newWord === undefined) { return str; }

        str = str + ' ' + newWord;
        return addWord;
    }

    return addWord;
}

/**
 * A function that interleaves an array with a bunch of values.
 * If the array length is not the same as the number of values to interleave,
 * the “extra” elements should end up at the end of the result.
 */
exports.interleave = function(x, ...y) {
    let ans  = new Array();
    let min = Math.min(x.length, y.length);
    let max = Math.max(x.length, y.length);

    let [i, j] = [0, 0];
    while (i < min) {
        ans[j++] = x[i];
        ans[j++] = y[i];
        i++;
    }

    while (i < max) {
        ans[j++] = x.length === max ? x[i] : y[i];
        i++;
    }

    return ans;
}

/**
 * A function that creates a cylinder object in the “Crockford Classless” style.
 * Both the radius and height should default to 1 if not passed in.
 * Include volume and surface area methods, as well as a widen method that
 * mutates the radius by a given factor and a stretch method to grow the height.
 * Expose the radius and height via getters.
 */
exports.cylinder = function(spec) {
    let {radius = 1, height = 1} = spec;

    let surfaceArea = () => Math.PI * 2 * radius * height + 2 * Math.PI * radius * radius;
    let volume = () => Math.PI * radius * radius * height;

    let widen = (factor) => { radius *= factor; }
    let stretch = (factor) => { height *= factor; }
    let toString = () => `Cylinder with radius ${width} and height ${height}`;

    return Object.freeze({
        get radius() {return radius;},
        get height() {return height;},
        surfaceArea,
        volume,
        widen,
        stretch,
        toString });
}

/**
 * A function that accepts two arguments: a crypto key and a crypto algorithm,
 * and returns an array of two functions that use the key and algorithm.
 * The first returned function is an encryption function that turns a string into
 * a hex string, and the second is a decryption function that turns the hex string
 * into a string. Use the built-in Node crypto module.
 */

exports.makeCryptoFunctions = function(key, alg) {
    const crypto = require('crypto');

    let encrypt = function(str) {
        const cipher = crypto.createCipher(alg, key);

        let encrypted = cipher.update(str, 'utf8', 'hex');
        encrypted += cipher.final('hex');
        return encrypted;
    }

    let decrypt = function(hex) {
        const decipher = crypto.createDecipher(alg, key);

        const encrypted = hex;
        let decrypted = decipher.update(encrypted, 'hex', 'utf8');
        decrypted += decipher.final('utf8');
        return decrypted;
    }

    return [encrypt, decrypt];
}


/**
 * A function that returns a promise for a random name from the uinames API.
 * Pass the URL query parameters in an object.
 * The only parameters your function are to accept are gender and region.
 * Do not just pass all paramters from your caller through to uinames.
 * Do pass the value 1 to uinames for the API parameter amount.
 * Simply for practice, your promise should with resolve successfully with a
 * string of the form 'Surname, name', or reject if there are any problems.
 * (Let the rejection happen naturally with whatever the module request-promise does.
 * You’ll get an object with a message field that has a response code and message from the API provider.)
 */
exports.randomName = function(spec) {
    let {gender, region} = spec;
    let adr = `https://uinames.com/api/?gender=${gender}&region=${region}&amount=1`;

    // https request requires the adress to be passed as an object with some metadata
    let options = {
            host : 'uinames.com',
            path:  adr,
            json: true
    };

    return new Promise((resolve, reject) => {

        const https = require('https');
        let request = https.request(options, (resp) => {

            var statusCode = resp.statusCode;
            let data = '';

            resp.on('data', (chunk) => { data += chunk; });

            resp.on('end', () => {
                let obj = JSON.parse(data);
                let ans = `${obj.surname}, ${obj.name}`;
                /2[0-9]{2}\b/.test(statusCode) ? resolve(ans) : reject({'message': `${statusCode}`});
            });

            resp.on('error', (err) => {
                reject(err);
            });
        });
        request.on('error', reject);
        request.end();

    });
}
