function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();
console.log("----------- Chase -----------")
Noodles.chase(Markov);
console.log("----------- Chase Call -----------")
Noodles.chase.call(Markov, Noodles);
console.log("----------- Chase Apply -----------")
Noodles.chase.apply(Markov, [Noodles]);
