

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

exports.fibGenerator = function*(base, max) {
    let [a, b] = [1, 1];
    while (b <= max) {
        [a, b] = [b, a*base];
        yield a;
    }
}
