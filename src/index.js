// Import global assets here. These assets will be used throughout
// the app. For instance, I've included all app-specific styles
// via the app.scss manifest, as well as our css helper library.
// I've also included images that aren't imported into components,
// but are being referenced by index.html.

import "ace-css/css/ace.css";
import "styles/app.scss";

import "images/favicon.ico";
import "images/favicon-16x16.png";
import "images/favicon-32x32.png";

// Copy index.html to /dist

import "./index.html";

// Initialize Elm App

const Elm = require("./app/Mottoto.elm");
const mountNode = document.getElementById("main");
const app = Elm.Mottoto.embed(mountNode, {
  nodeEnv: NODE_ENV,
  apiUrl: API_URL
});

app.ports.removeToken.subscribe(() => {
  window.localStorage.removeItem(TOKEN_STORAGE_KEY);
});

app.ports.getToken.subscribe(() => {
  const token = window.localStorage.getItem(TOKEN_STORAGE_KEY);
  if (token) {
    app.ports.getUserFromToken.send(token);
  }
});

app.ports.setToken.subscribe((token) => {
  if (token) {
    window.localStorage.setItem(TOKEN_STORAGE_KEY, token);
  }
});
