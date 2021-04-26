import consumer from "./consumer"

  consumer.subscriptions.create("MessageChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `<p>${data.content.text}</p>`;
      const messages = document.getElementById('message');
      const newMessage = document.getElementById('message_text');
      let inputElement = document.querySelector('input[name="commit"]');
      inputElement.disabled = false;
      messages.insertAdjacentHTML('afterbegin', html);
      newMessage.value='';
    }
  });