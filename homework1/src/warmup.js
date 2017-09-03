

exports.change = function(cents) {
    if (cents < 0) { throw new RangeError(); }

    const coins = [25, 10, 5, 1];
    var ans = [0, 0, 0, 0];


    var i = 0;
    coins.forEach(function(coin) {
        ans[i] = Math.floor(cents / coins[i]);
        cents -= ans[i]*coins[i];
        i++;
    });
    return ans;
};
