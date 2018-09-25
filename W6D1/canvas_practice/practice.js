document.addEventListener("DOMContentLoaded", function(){

  let x = 0;
  let y = 0;
  let increase = true;
  window.setInterval(function() {
    if (x > 200) { increase = false; }
    if (increase){
      x++;
      y++;
    } else {
      x--;
      y--;
      if(x < 20) increase = true;
    }

    draw(x, y);

  }, 100);

});

function draw(x, y) {
  const canvas = document.getElementById('myCanvas'); // in your HTML this element appears as <canvas id="myCanvas"></canvas>
  const ctx = canvas.getContext('2d');
  canvas.height = 500;
  canvas.width = 500;
  ctx.fillStyle = 'rgb(200,0,0)'; // sets the color to fill in the rectangle with


  ctx.fillRect(10 + x, 10 + y, 55 + x, 50 + y);   // draws the rectangle at position 10, 10 with a width of 55 and a height of 50
  ctx.fillRect(230 + x, 10 + y, 55 + x, 50 + y);

  circle(ctx, x, y);
  circle(ctx, 200 + x, y);

  triangle(ctx, 100 + x, 200 + y);

}

function circle(ctx, x=100, y=75) {
  ctx.beginPath();
    ctx.strokeStyle = `rgb(0,${x},${y})`;
    ctx.lineWidth = 10;
    ctx.arc(x, y, 50 + x, 0 + y, (2) * Math.PI);
    ctx.fillStyle = 'rgb(200, 200, 0)';
    ctx.fill();
  ctx.stroke();
}

function triangle(ctx, x, y) {
    ctx.beginPath();
    ctx.moveTo(x, y);
    ctx.lineTo(x + 100, y + 75);
    ctx.lineTo(x + 100, y + 25);
    ctx.fill();
}
