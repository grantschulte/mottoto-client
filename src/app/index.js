// Asset importing for files referenced in index.html

import "ace-css/css/ace.css";
import "styles/app.scss";

import "images/favicon.ico";
import "images/favicon-16x16.png";
import "images/favicon-32x32.png";

import "./index.html";

// Initialize Elm App

const Elm = require("./Main.elm");
const mountNode = document.getElementById("main");
const app = Elm.Main.embed(mountNode, {
  nodeEnv: NODE_ENV,
  apiUrl: API_URL
});
