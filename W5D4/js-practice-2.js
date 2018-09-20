function titleize(names, printCallback) {
  printCallback(names.map((name)=>{
      return `Mx. ${name} Jingleheimer Schmidt`
    })
  );
}


//console.log("------------- Elephant Prototype Functions --------------");

const Elephant = function(name, height, gerund_form) {
  this.name = name;
  this.height = height;
  this.gerund_form = gerund_form;
  this.tricks = [];
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}
Elephant.prototype.grow = function() {
  this.height += 12;
  console.log(`${this.name} grows by 12 inches and now is: ${this.height} inches tall!`);
}
Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
  console.log(`${this.name} learned ${trick}`);
}

Elephant.prototype.play = function() {
  console.log(`${this.gerund_form} is ${this.tricks[Math.floor(Math.random() * this.tricks.length)]}`);
}

// console.log("------------- Elephant Function Invocations --------------");
Elephant.prototype.paradeHelper = function() {
  console.log(`${this.name} is trotting by!`);
}


console.log("------------- Titleize --------------");
titleize(["Mary", "Brian", "Leo"], (arr) => console.log(arr));
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt

console.log("------------- Elephant Prototype Functions --------------");
let sandy = new Elephant('sandy', 12, 'sandying');
sandy.trumpet();
sandy.grow();
sandy.addTrick('run');
sandy.play();



console.log("------------- Elephant Function Invocations --------------");
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
herd.forEach((el) => { el.paradeHelper(); });


console.log("------------- Closures --------------")

let bfastOrder = function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};
