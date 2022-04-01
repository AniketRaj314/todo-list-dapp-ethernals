// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Todolist {

    struct Task {
        string task_name;
        bool is_done;
    }

    // Create a dictionary with address as key, and array of Tasks as value
    mapping (address => Task[]) private Users;

    function addTask (string calldata _task) external {
        Users[msg.sender].push(Task({
            task_name: _task,
            is_done: false
        }));
    }

    function getTask (uint _taskIndex) external view returns (Task memory) {
        Task memory task = Users[msg.sender][_taskIndex];
        return task;
    }

    function updateTaskStatus (uint _taskIndex, bool _status) external {
        Users[msg.sender][_taskIndex].is_done = _status;
    }

    function deleteTask (uint _taskIndex) external {
        delete Users[msg.sender][_taskIndex];
    }

    function getTaskCount() external view returns (uint256) {
        return Users[msg.sender].length;
    }
}