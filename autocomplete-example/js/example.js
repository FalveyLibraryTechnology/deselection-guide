let books = [];

const MULTIPLE = "<i>Multiple matches.</i>";
const NORESULTS = "<i>No matches.</i>";
function query(q) {
  let hit = false;
  for (let i = 0; i < books.length; i++) {
    let sub = books[i].barcode.substr(0, q.length);

    if (sub > q) {
      return hit;
    }

    if (sub === q) {
      if (hit && books[i].title !== hit.title) {
        return MULTIPLE;
      }
      hit = books[i];
    }
  }
  return hit;
}

let activeInput, acEl;
let fieldsEl = document.getElementById("fields");
function focusAC(e) {
  activeInput = e.target;
  acEl = activeInput.closest(".ac-field").querySelector(".ac-display");
}
function addNewAC() {
  let newAC = new Template("ac-input");
  fieldsEl.appendChild(newAC);

  let newACEl = newAC.querySelector(".ac-display");
  newACEl.addEventListener(
    "click",
    function() {
      if (newACEl.innerHTML !== MULTIPLE && newACEl.innerHTML !== NORESULTS) {
        newAC.classList.add("is:set");
        newAC.querySelector(".ac-hidden").value = newACEl.dataset.barcode;
        if (!document.querySelector(".ac-field:not(.is\\:set)")) {
          addNewAC();
        }
      }
    },
    false
  );

  newAC.querySelector(".ac-edit-btn").addEventListener(
    "click",
    function() {
      newAC.querySelector(".ac-hidden").removeAttribute("value");
      newAC.classList.remove("is:set");
    },
    false
  );

  let newInput = newAC.querySelector(".ac-input");
  newInput.addEventListener("focus", focusAC, false);
  newInput.addEventListener(
    "input",
    _ => autocomplete(newInput.value, newACEl),
    false
  );

  return newInput;
}

function acShow(text, acEl, barcode = false) {
  acEl.innerHTML = text;
  if (barcode) {
    acEl.dataset.barcode = barcode;
  } else {
    delete acEl.dataset.barcode;
  }
}
function acHide(acEl) {
  acEl.innerHTML = "";
}
function autocomplete(q, acEl) {
  if (!q || q.match(/\D/)) {
    acHide(acEl);
    return;
  }
  let ret = query(q);
  if (!ret) {
    acShow(NORESULTS, acEl);
  } else if (typeof ret === "string") {
    acShow(ret, acEl);
  } else {
    acShow(`${ret.title} (${ret.year})`, acEl, ret.barcode);
  }
}

function setup(context = document) {
  books.sort((a, b) => a.barcode - b.barcode);
  let newInput = addNewAC();
  newInput.focus();
}

function fakeSubmit() {
  let output = "";
  document.querySelectorAll(".ac-hidden").forEach(el => {
    if (el.value) output += el.value + "\n";
  });
  document.getElementById("output").innerHTML = output;
}
document.getElementById("submit").addEventListener("click", fakeSubmit, false);

Papa.parse("./example-book-data.csv", {
  download: true,
  step: row => {
    let [barcode, title, year] = row.data;
    books.push({ barcode, title, year });
  },
  complete: _ => setup()
});
