    function handleDrop(event, targetStat) {
        event.preventDefault();
        var textval = event.dataTransfer.getData("textval");
        var stat = event.dataTransfer.getData("stat");
        var itemElement = document.getElementById(draggedItem);

        // Change the stat of the dragged item
        itemElement.querySelector('.list-group-item').innerHTML = targetStat + '. ' + itemElement.querySelector('.list-group-item').textContent;

        // Update the stat to the target column
        updateStatusOnServer(targetStat, itemElement.querySelector('input[name="textval"]').value);

        // Remove the item from the original column
        itemElement.parentNode.removeChild(itemElement);
    }
   
