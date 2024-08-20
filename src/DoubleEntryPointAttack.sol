//i only did this in the DeployScript.s.sol, first get the vault address, deploy bot, and then try if malicious tx reverts.


// SPDX-License-Identifier: MIT
// pragma solidity 0.8.20;
// import { Script, console } from "forge-std/Script.sol";
// import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
// import {DoubleEntryPoint, CryptoVault} from "../src/DoubleEntryPoint.sol";
// contract DeployAttack is Script {
//     function setUp() public {}

//     function run() public {
//         vm.startBroadcast();

//         DoubleEntryPoint victim = DoubleEntryPoint(0xEcA55E073e79577D2FaA508E354645D3Ab1E68C9);
//         CryptoVault vault = CryptoVault(victim.cryptoVault());
        
//         // we must first create the Forta detection bot.
//         // console.log(victim.cryptoVault()); //  forge create src/FortaAlertBot.sol:AlertBot --rpc-url $RPC --private-key $KEY --constructor-args "vault address"
//         // victim.forta().setDetectionBot(0xE6E702B581a2c602642002a70bffa659977014d2); // the bot address
        
//         //test to see if we can still steal the tokens
//         // address DET = address(vault.underlying());
//         // address LGT = victim.delegatedFrom();
//         // vault.sweepToken(IERC20(LGT)); 
        
//         vm.stopBroadcast();
//     }
// }
