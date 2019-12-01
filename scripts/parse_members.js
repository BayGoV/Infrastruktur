const fs = require('fs');
const stdinBuffer = fs.readFileSync(0);
const jsdom = require("jsdom");
const { JSDOM } = jsdom;
const dom = new JSDOM(stdinBuffer.toString());
const $ = require("jquery")(dom.window);
const rows = [...$('tr')];
const members = rows.map(row => { 
  return {
    id: row.querySelector("td:nth-child(2)").textContent,
    first_name: row.querySelector("td:nth-child(6)").textContent,
    last_name: row.querySelector("td:nth-child(5)").textContent,
    status: row.querySelector("td:nth-child(10)").textContent,
  } 
});
console.log(JSON.stringify(members));
