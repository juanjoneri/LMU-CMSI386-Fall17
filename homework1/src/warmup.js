

exports.change = function(cents) {
    if (cents < 0) { throw new RangeError(); }

    const coins = [25, 10, 5, 1];
    let  ans = [0, 0, 0, 0];

    let i = 0;
    coins.forEach(function(coin) {
        ans[i] = Math.floor(cents / coin);
        cents -= ans[i]*coin;
        i++;
    });
    return ans;
};

exports.stripQuotes = function(str) {
    return str.replace(/["'\\]/g, '');
}

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

exports.powers = function(base, max, fun) {
    let pow = 1;

    while (pow <= max) {
        fun(pow);
        pow *= base;
    }
}

exports.powersGenerator = function*(base, max) {
    let [a, b] = [1, 1];
    while (b <= max) {
        a = b;
        b = a*base;
        yield a;
    }
}

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

exports.cylinder = function(spec) {
    let { radius, height } = spec;

    let surfaceArea = () => Math.PI*2*radius*height + 2*Math.PI*radius*radius;
    let volume = () => Math.PI*radius*radius*height;

    let widen = (factor) => { width = width*factor; }
    let stretch = (factor) => { height = height*factor; }
    let toString = () => `Cylinder with radius ${width} and height ${height}`;
    return Object.freeze({ radius, height, surfaceArea, volume, widen, stretch, toString });
}
