function mad_lib(verb, adjective, noun) {
  return `We shall ${verb} the ${adjective} ${noun}.`;
}



function isSubstring(str, substr) {
  return str.includes(substr);
}

function fizzBuzz(array) {
  divisbl = [];
  for(let i = 0; i < array.length; ++i) {
    if (array[i] % 15 == 0) { }
    else if(array[i] % 3 == 0 || array[i] % 5 == 0){
      divisbl.push(array[i])
    }
  }
  return divisbl;
}


function isPrime(num) {
  if (num == 2) return true;
  if ((num < 2) || (num % 2 == 0)) return false;
  for (let n = 3; n <= Math.sqrt(num); ++n){
    if (num % n == 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  sum = 0;
  count = 0;
  num = 2;
  while (count < n) {
    if (isPrime(num)){
      sum += num;
      count += 1;
    }
    num += 1;
  }
  return sum;
}

console.log('Mad_Lib: ', mad_lib('MAKE', 'BEST', 'GUAC'));
console.log('isSubstring: ', isSubstring('wrinkle in time', 'time') === true);

console.log('fizzBuzz: ', fizzBuzz([1,3,5,10,15,20,30]));

console.log('isPrime: ', isPrime(2) === true);
console.log('isPrime: ', isPrime(10) === false);
console.log('isPrime: ', isPrime(15485863) === true);
console.log('isPrime: ', isPrime(3548563) === false);

console.log('sumOfNPrimes: ', sumOfNPrimes(0) === 0);
console.log('sumOfNPrimes: ', sumOfNPrimes(1) === 2);
console.log('sumOfNPrimes: ', sumOfNPrimes(4) === 17);
