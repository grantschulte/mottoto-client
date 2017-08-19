module.exports = (env) => {
  let config = {
    dev: {
      "API_URL": JSON.stringify("http://localhost:5000"),
      "NODE_ENV": JSON.stringify("development")
    },

    staging: {
      "API_URL": JSON.stringify("http://staging.api.com"),
      "NODE_ENV": JSON.stringify("staging")
    },

    prod: {
      "API_URL": JSON.stringify("http://prod.api.com"),
      "NODE_ENV": JSON.stringify("production")
    }
  };

  console.log(env);
  return config[env];
}
