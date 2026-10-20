// Reusable quiz widget.
//
// Usage in a lesson:
//   <div class="quiz" id="quiz-0001"></div>
//   <script type="application/json" data-quiz-for="quiz-0001">
//     [{ "q": "Question?", "options": ["A", "B", "C", "D"], "answer": 2,
//        "why": "Explanation shown after answering (HTML allowed)." }]
//   </script>
//   <script src="../assets/quiz.js"></script>
//
// Options are shown in the order given; the author controls answer position.
// Immediate feedback per question, score at the end. Results are not stored:
// re-taking the quiz on a later day is the point (spaced retrieval).

(function () {
  function el(tag, attrs, html) {
    const node = document.createElement(tag);
    for (const k in attrs || {}) node.setAttribute(k, attrs[k]);
    if (html != null) node.innerHTML = html;
    return node;
  }

  function render(root, questions) {
    root.innerHTML = "";
    let answered = 0;
    let correct = 0;
    const score = el("p", { class: "quiz-score", hidden: "" });

    questions.forEach(function (item, qi) {
      const box = el("div", { class: "quiz-q" });
      box.appendChild(el("p", { class: "prompt" },
        '<span class="n">' + (qi + 1) + "/" + questions.length + "</span>" + item.q));
      const opts = el("div", { class: "quiz-options", role: "group" });
      const feedback = el("div", { class: "quiz-feedback", "aria-live": "polite" });

      item.options.forEach(function (text, oi) {
        const btn = el("button", { type: "button" });
        btn.textContent = text;
        btn.addEventListener("click", function () {
          const buttons = opts.querySelectorAll("button");
          buttons.forEach(function (b) { b.disabled = true; });
          buttons[item.answer].classList.add("correct");
          const right = oi === item.answer;
          if (!right) btn.classList.add("wrong");
          feedback.innerHTML = (right
            ? '<strong class="ok">Correct.</strong> '
            : '<strong class="no">Not quite.</strong> ') + (item.why || "");
          answered += 1;
          if (right) correct += 1;
          if (answered === questions.length) {
            score.hidden = false;
            score.innerHTML = "You got <strong>" + correct + " / " + questions.length +
              "</strong>. Take this again in a day or two, from memory, without rereading first.";
            const reset = el("button", { type: "button", class: "quiz-reset" }, "Retake");
            reset.addEventListener("click", function () { render(root, questions); });
            score.appendChild(reset);
          }
        });
        opts.appendChild(btn);
      });

      box.appendChild(opts);
      box.appendChild(feedback);
      root.appendChild(box);
    });
    root.appendChild(score);
  }

  document.querySelectorAll("script[data-quiz-for]").forEach(function (s) {
    const root = document.getElementById(s.getAttribute("data-quiz-for"));
    if (!root) return;
    try {
      render(root, JSON.parse(s.textContent));
    } catch (e) {
      root.textContent = "Quiz failed to load: " + e.message;
    }
  });
})();
