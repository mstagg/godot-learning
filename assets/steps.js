// Reusable step checklist.
//
// Usage: <ol class="steps" data-steps-key="0001"> <li>…</li> … </ol>
//        <script src="../assets/steps.js"></script>
//
// Adds a "done" tick to each step and remembers it in this browser only.
// Storage can be unavailable (private window, file:// quirks); the list
// still works without it, it just won't remember.

(function () {
  function load(key) {
    try { return JSON.parse(localStorage.getItem("steps:" + key) || "[]"); }
    catch (e) { return []; }
  }
  function save(key, done) {
    try { localStorage.setItem("steps:" + key, JSON.stringify(done)); }
    catch (e) { /* not persisted; fine */ }
  }

  document.querySelectorAll("ol.steps[data-steps-key]").forEach(function (list) {
    const key = list.getAttribute("data-steps-key");
    const done = load(key);
    list.querySelectorAll(":scope > li").forEach(function (li, i) {
      const label = document.createElement("label");
      label.className = "tick";
      const box = document.createElement("input");
      box.type = "checkbox";
      box.checked = done.indexOf(i) !== -1;
      li.classList.toggle("done", box.checked);
      box.addEventListener("change", function () {
        li.classList.toggle("done", box.checked);
        const now = load(key).filter(function (n) { return n !== i; });
        if (box.checked) now.push(i);
        save(key, now);
      });
      label.appendChild(box);
      label.appendChild(document.createTextNode(" done"));
      const title = li.querySelector(".step-title");
      if (title) title.after(label);
      else li.prepend(label);
    });
  });
})();
