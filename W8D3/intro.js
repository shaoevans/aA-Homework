function madLib(word1, word2, word3) {
    return 'We shall ${word1.toUpperCase()} the ${word2.toUpperCase()} ${word3.toUpperCase()}.'
}

function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
  }

function fizzbuzz(arr) {
    const fizzBuzzArr = [];

    arr.forEach(el => {
        if ((el % 3 === 0) ^ (el % 5 === 0)) {
            fizzBuzzArr.push(el)
        }
    });

    return fizzBuzzArr
}

function isPrime(num) {
    if (num < 2) { return false;}
    for (let i = 2; i < num; i ++) {
        if (num % i === 0) {
            return false;
        }
    }
    return true;
}

function firstNPrimes(num) {
    const primes = [];
    var count = 2;
    for (let i = 0, i < num; i ++) {
        while (!isPrime(count)) {
            count++;
        }
        primes.push(count);
        count++;
    }
    return primes;
}

function sumOfNPrimes (num) {
    sum = 0;
    var primes = firstNPrimes(num);
    primes.forEach (el => {
        sum += el
    });
    console.log(sum);
    return sum;
}

sumOfNPrimes(5);