// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

contract Lottery {

    address public manager;

    address payable public lastWinner;

    address[] public players;

    constructor(){

        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value >= 1 ether, "Insufficient ETH, entry costs 1 ETH");
        players.push(msg.sender);
    }

    function pickWinner() public returns (address) {
        require(msg.sender == manager);
        uint winnerIndex = random() % players.length;
        lastWinner = payable(players[winnerIndex]);
        lastWinner.transfer(address(this).balance);
        players = new address[](0);
        return lastWinner;
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

}