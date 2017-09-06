// Set your default environment here. This value will
// be overwritten by env settings passed to webpack
// via npm scripts

const defaultEnvironment = "development";

module.exports = (env = defaultEnvironment) => {
  const config = {
    development: {
      "API_URL": JSON.stringify("http://localhost:5000"),
      "NODE_ENV": JSON.stringify("development"),
      "TOKEN_STORAGE_KEY": JSON.stringify("mottoto-user-token")
    },

    staging: {
      "API_URL": JSON.stringify("https://mottoto-api-staging.herokuapp.com"),
      "NODE_ENV": JSON.stringify("staging"),
      "TOKEN_STORAGE_KEY": JSON.stringify("mottoto-user-token")
    },

    production: {
      "API_URL": JSON.stringify("https://mottoto-api.herokuapp.com"),
      "NODE_ENV": JSON.stringify("production"),
      "TOKEN_STORAGE_KEY": JSON.stringify("mottoto-user-token")
    }
  };

  return config[env];
}
