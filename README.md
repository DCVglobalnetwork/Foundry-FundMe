# Getting Started
Requirements
git
You'll know you did it right if you can run 
```shell
git --version 
```
and you see a response like 
```shell
git version x.x.x
```
foundry
You'll know you did it right if you can run 
```shell
forge --version
```
and you see a response like 
```shell
forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)
```
# Usage
## Deploy:
```shell
forge script script/DeployFundMe.s.sol
```
## Testing
4 test tiers 

***Unit***
***Integration***
***Forked***
***Staging***
This repo cover ***Unit*** and ***Forked***.

```shell
forge test
```
or

// Only run test functions matching the specified regex pattern.

```shell
"forge test -m testFunctionName" is deprecated. Please use 

forge test --match-test testFunctionName
```
or

```shell
forge test --fork-url $SEPOLIA_RPC_URL
```

## Test Coverage
```shell
forge coverage
```

# Deployment to a testnet or mainnet

**Setup environment variables**


You'll want to set your SEPOLIA_RPC_URL and PRIVATE_KEY as environment variables. You can add them to a .env file, similar to what you see in .env.example.

PRIVATE_KEY: The private key of your account (like from metamask). NOTE: FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
You can learn how to export it here.
SEPOLIA_RPC_URL: This is url of the sepolia testnet node you're working with. You can get setup with one for free from Alchemy
Optionally, add your ETHERSCAN_API_KEY if you want to verify your contract on Etherscan.

**Get testnet ETH**


Head over to faucets.chain.link and get some testnet ETH. You should see the ETH show up in your metamask.


**Deploy**

```shell
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Scripts
After deploying to a testnet or local net, you can run the scripts.

Using cast deployed locally example:

```shell
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```

or

```shell
forge script script/Interactions.s.sol --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```

## Withdraw

```shell
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

## Estimate gas
You can estimate how much gas things cost by running:

```shell
forge snapshot
```

***HAPPY*** **CODING**
