pragma solidity >=0.7.0;

contract TodoList {

    struct TodoItem {
        string content;
        bool checked;
    }

    mapping(address => TodoItem[]) todoList;

    function getListForSender()
    public
    view
    returns (TodoItem[] memory todos)
    {
        return todoList[msg.sender];
    }

    function addTodo(string memory _content) public {
        todoList[msg.sender].push(TodoItem(_content, false));
    }

    function toggleTodo(uint _itemId) public {
        TodoItem[] memory _todos = todoList[msg.sender];
        require(_todos.length >= (_itemId + 1), "item doesn't exist");
        todoList[msg.sender][_itemId].checked = !_todos[_itemId].checked;
    }

}