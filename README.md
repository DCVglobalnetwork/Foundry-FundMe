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

Deployment to a testnet or mainnet
