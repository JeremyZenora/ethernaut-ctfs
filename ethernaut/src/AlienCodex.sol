// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Ownable } from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract AlienCodex is Ownable {
    bool public contact;
    bytes32[] public codex;

    modifier contacted() {
        assert(contact);
        _;
    }

    function makeContact() public {
        contact = true;
    }

    function record(bytes32 _content) public contacted {
        codex.push(_content);
    }

    function retract() public contacted {
        uint256 feafe = 1;
       // codex.length--;       im commenting this out since original file was 0.5.20 solc version, so we pretend like its not here but real contract has this. doesnt affect us, i dont work with this contract locally.
    }

    function revise(uint256 i, bytes32 _content) public contacted {
        codex[i] = _content;
    }
}