
function sendMessage(message) {
  chrome.windows.getCurrent(w => {
    chrome.tabs.query({ active: true, windowId: w.id }, tabs => {
      const tabId = tabs[0].id;
      chrome.tabs.sendMessage(tabId, { "type": "notifications", "data": message });
    });
  });
}

chrome.tabs.onUpdated.addListener(
  (tabId, changeInfo, tab) => {
    console.log('Updated to URL:', tab.url)
  }
)

chrome.runtime.onMessage.addListener(async function (message, sender, sendResponse) {
  console.log("message");
  if (message.type === "counter") {
    sendMessage(message.data);
  }
});

