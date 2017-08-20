const faker = require("faker");
const fs = require("fs");

function makeData() {
  const data = {
    users: [],
    mottos: []
  };

  Object.keys(data).forEach(k => {
    for (let i = 0; i < 100; i++) {
      data[k].push(getModelBase(k, i));
    }
  });

  let json = JSON.stringify(data);

  fs.writeFile("./db/data.json", json, (error) => {
    if (error) { throw error; }
  });
}

function getModelBase(k, i) {
  switch (k) {
    case "users":
      return {
        "id": i,
        "email": faker.internet.email(),
        "handle": faker.internet.userName(),
        "motto": faker.lorem.sentence()
      }
      break;

    case "mottos":
      return {
        "id": i,
        "text": faker.lorem.sentence(),
        "userId": i
      }
      break;

    default:
      return {};
  }
}

makeData();
