pragma solidity 0.8.2;

contract Lottery {

    address public manager;

    constructor(){
        
        manager = msg.sender;
    }

}