// for phoenix_html support, including form and button helpers
// copy the following scripts into your javascript bundle:
// * deps/phoenix_html/priv/static/phoenix_html.js

let socket = new window.Phoenix.Socket("/switches", {})

socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("switches", {})
channel.join()
    .receive("ok", resp => {
        console.log("Joined successfully", resp)
    })
    .receive("error", resp => {
        console.log("Unable to join", resp)
    })


channel.on("update", payload => {
    console.log(`Update:`)
    console.log(payload)
    Object.keys(payload).forEach(key => {
        const input = document.querySelector(`[data-id="${key}"]`);
        input.checked = payload[key] === "on";
    })
})

document.querySelectorAll('input').forEach(input => {
    input.onchange = (v) => {
        const id = parseInt(input.dataset.id);
        channel.push("toggle", {number: id, value: v.target.checked});
    }
})