const faker = require("faker");
const fs = require("fs");

const data = {
  mottos: [
    {
      "id": "100",
      "text": "She's my honey bunny, she's my honey bunny.",
      "userId": "100"
    }
  ],
  users: [
    {
      "id": "100",
      "email": "orjazzmic@gmail.com",
      "handle": "avantgrant",
      "mottoId": "100"
    }
  ]
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

makeData();
