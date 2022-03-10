//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract HelloWorld {
    event UpdatedMessages(string oldStr, string newStr);
    bool constant above18 = true;
    
    string public message;
    string public HelloWorldStatement = "Hello World";

    constructor (string memory initMessage) {
        message = initMessage;
    }

    function update (string memory newMessage) public {
        string memory oldMsg = message;
        message = newMessage;
        emit UpdatedMessages (oldMsg, newMessage);
    }

    function viewHelloWorld() public view returns(string memory) {
        return string (HelloWorldStatement);
    }
}