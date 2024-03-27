const columns = document.querySelectorAll(".ourcolumn");

columns.forEach((ourcolumn) => {
  new Sortable(ourcolumn, {
    group: "shared",
    animation: 150,
    ghostClass: "blue-background-class"
  });
});