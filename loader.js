(function() {
    'use strict';
    window.addEventListener('message', async (e) => {
        if (e.data && e.data.type === 'FETCH_CRX_RESOURCE' && e.data.path) {
            const path = e.data.path;
            const blob = await fetch(chrome.runtime.getURL(path)).then((resp) => resp.blob());
            window.postMessage({ type: 'FETCH_CRX_RESOURCE_RESPONSE', path, blob }, '*');
        }
    });
    const s = document.createElement('script');
    s.id = 'moonbit-leetcode-crx-loader';
    s.src = chrome.runtime.getURL('index.js');
    document.documentElement.appendChild(s);
})();
