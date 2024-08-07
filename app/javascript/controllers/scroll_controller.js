import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scrol"
// Connects to data-controller="scrol"
export default class extends Controller {
  connect() {
    console.log("Connected");
    const messages = document.getElementById("messages");

    // Set up the MutationObserver to observe changes to the child nodes
    this.observer = new MutationObserver(() => {
      this.resetScroll(messages);
    });

    // Observe child nodes for changes
    this.observer.observe(messages, { childList: true });

    // Initial call to scroll to the bottom
    this.resetScroll(messages);
  }

  /** On stop */
  disconnect() {
    console.log("Disconnected");
    // Disconnect the observer when the controller is disconnected
    if (this.observer) {
      this.observer.disconnect();
    }
  }

  /** Custom function */
  resetScroll(messages) {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}

