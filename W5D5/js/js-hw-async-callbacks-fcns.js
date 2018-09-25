window.setTimeout(()=> alert('HAMMERTIME'), 5000);


function hammerTime(time) {
  window.setTimeout(function(){
  alert(`${time} is hammertime!`);
  }, time);
}

hammerTime(5000);
