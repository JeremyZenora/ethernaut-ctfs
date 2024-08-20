## ETHERNAUT-CTFS

I am using `Foundry` framework for solving the CTFs, I find it to be the most convenient one, you can just use solidity language to complete everything, no JS or PYTHON needed.

I solved `31 Ethernaut challenges in <4 days`. I did not include the script file for most challenges, however if some more complex logic is needed for interacting with the contracts, it should be in the Attacks files.

For sure by the time you read this, there might be more CTFs added, I might add them in the future as well:)

to install libraries:
```
forge install OpenZeppelin/openzeppelin-contracts
```
I completed one challenge using Huff language.
to install Huff (you need npm):
```
npm install -g huffc
forge install huff-language/huff-rs
```

for debugging, installation problems or anything else, ask your buddy `ChatGPT`.
.
.
.
.
.
.

Generic foundry info

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
