document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const handleSubmit = (e) => {
    e.preventDefault();
    let ul = document.getElementById("sf-places");
    let li = document.createElement("li");
    li.textContent = document.querySelector('.favorite-input').value;
    ul.appendChild(li);
}

const listSubmitBtn = document.querySelector(".favorite-submit");
listSubmitBtn.addEventListener('click', handleSubmit);
  // adding new photos

  // --- your code here!



});
