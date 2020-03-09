const allColumns = document.querySelectorAll(".column-name");
const allTableNames = document.querySelectorAll(".table-name");
const tableNames = [];
const allTableNamesStr = allTableNames.forEach((tablediv) => {
  tableNames.push(tablediv.id.toLowerCase());
});

let counter = 0;
let lineAry = []

allColumns.forEach((column) => {
  const keyWord = column.innerText.toLowerCase().split("_")[0] + "s";
  const getIndex = (tableName) => {
    return tableName == keyWord;
  };
  if (tableNames.includes(keyWord)) {
    const index = tableNames.findIndex(getIndex);
    const table = allTableNames[index];
    let line = undefined;
    setTimeout(() => {
    line = new LeaderLine(table.parentElement.children[1], column.parentElement);
    lineAry.push(line)
    }, 1200);
  }
});

const allLines = () => {
  return lineAry
}

export { allLines }