const faker = require("faker");
const fs = require("fs");

const data = {
  mottos: [],
  users: []
};

function makeData() {
  Object.keys(data).forEach(k => {
    for (let i = 0; i < 100; i++) {
      data[k].push(getModelBase(k, i));
    }
  });

  const json = JSON.stringify(data);

  fs.writeFile("./db/data.json", json, error => {
    if (error) { throw error; }
  });
}

function getModelBase(k, i) {
  switch (k) {
    case "users":
      return {
        "id": (i).toString(),
        "email": faker.internet.email(),
        "handle": faker.internet.userName(),
        "mottoId": (i).toString()
      }
      break;

    case "mottos":
      return {
        "id": (i).toString(),
        "text": faker.lorem.sentence(),
        "userId": (i).toString()
      }
      break;

    default:
      return {};
  }
}

function findMottoText(i) {
  let motto = data.mottos.find(m => m.userId === i);
  return motto.text || "";
}

makeData();
