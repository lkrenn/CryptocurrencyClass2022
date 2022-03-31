// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{

    // Notify the world when message updates
    event NewMessage(string message);

    // Long term storage
    string public message;

    // Assign an admin for the message
    address public owner;

    modifier IsOwner(){
        require(msg.sender == owner, "Only the admin can update.");

        // Execute the main block of code after this
        _;
    }

    // Instead of an owner, make an array showing who is allowed
    mapping(address => bool) isAllowed; 

    modifier IsAllowed(){
        require(isAllowed[msg.sender], "Only allowed people can update.");

        // Execute the main block of code after this
        _;
    }


    constructor(){
        owner = msg.sender; // Set the owner as the user who created this smart contract
    }

    // Add special users
    function addSpecialUsers(address _specialUser) public IsOwner(){
        isAllowed[_specialUser] = true;
    }


    // Call IsOwner before executing updateMessage
    function updateMessage(string memory _message) public IsOwner() {

        // Only the admin can change the message
        // Note: Assert will use up all the gas you specify, require will give you change back
        // if you allocate more gas than needed. 
        require(msg.sender == owner, "Only the admin can update.");

        //message.push(_message);

        message = _message;
        emit NewMessage(message);//[message.length-1]);
    }
}
