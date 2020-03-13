/**
 *  <div class="blob" data-template="blob-template">
 *    <div class="blob-body">
 *      <button class="blob-header" data-slot="header">Default Header</button>
 *      <p data-slot="description">Default Description</p>
 *    </div>
 *    <footer class="blob-footer" data-slot="footer">Default Footer</footer>
 *  </div>
 *
 *  const el = Template("blob", { header: "TITLE", footer: "Public Domain 1.0" });
 *  el.render({ description: "Forgot the description." });
 */

// === With render ===

const Template = (function TemplateEngine() {
  function _render(slots, data) {
    for (let key in data) {
      const content = data[key];
      for (let slot of slots[key]) {
        if (data[key] instanceof HTMLElement) {
          // Replace with Element
          while (slot.hasChildNodes()) {
            slot.removeChild(slot.lastChild);
          }
          slot.appendChild(data[key]);
        } else if (content instanceof Object && !Array.isArray(content)) {
          // Set attributes
          for (let attr in content) {
            try {
              slot[attr] = content[attr];
            } catch (e) {
              console.error(
                "Slot element doesn't have attribute '" + attr + "'"
              );
            }
          }
        } else if (
          slot instanceof HTMLInputElement &&
          slot.type !== "submit" &&
          slot.type !== "button"
        ) {
          // Set value on input elements
          slot.value = content;
        } else {
          // Set innerHTML. Join arrays.
          slot.innerHTML = Array.isArray(content) ? content.join(" ") : content;
        }
      }
    }
  }

  let templates = {};
  document
    .querySelectorAll("[data-template]")
    .forEach(function templateInit(_el) {
      const el = _el.parentNode.removeChild(_el);
      templates[el.dataset.template] = el;
      el.removeAttribute("data-template");
    });

  return function getTemplate(id, data = {}) {
    if (typeof templates[id] === "undefined") {
      throw ReferenceError("Undefined Template: " + id);
    }

    let slots = {};
    const cloneEl = templates[id].cloneNode(true);
    // Need to get slots here because it's a clone
    cloneEl.querySelectorAll("[data-slot]").forEach(function(el) {
      if (typeof slots[el.dataset.slot] === "undefined") {
        slots[el.dataset.slot] = [];
      }
      slots[el.dataset.slot].push(el);
    });

    cloneEl.render = function(data) {
      return _render(slots, data);
    };

    _render(slots, data);

    return cloneEl;
  };
})();
