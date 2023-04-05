# What is ChainPact

ChainPact lets anyone create an agreement on to blockchain, without any intermediaries. Unlike traditional agreements though, ChainPact depends on conditions coded into smart contract for execution of actions and obligations. The entire _pact_ revolves around fulfilment of conditions on the data about the pact stored in the smart contract. This makes pacts inflexible and direct, as against ambiguous nature of more traditional verbal agreements.
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/pact_to_chain.png" alt="Pact to chain" style="width:400px;"/>
</div>

### Use Cases

- Creating a pact with a third party that involves the workflow of a gig work or an employment contract
- Creating a blockchain-based DAO voting proposal
- Creating a fund-pooling or fund raising campaign based on blockchain
- Signing a plain document by multiple people using their web3 wallet


### About Smart contracts

Smart contracts are like blocks of code which reside on the blockchain and are executed by the nodes to change the state of the blockchain. The support for this functionality in blockchain platforms like ethereum allows people to carry out more sophisticated data modifications and workflows apart from mere payments alone, as in Bitcoin. The smart contract contains immutable code sent to the blockchain through a transaction and is assigned an address, similar to wallet address, but without any private key. The functionality in the smart contract can then be accessed by sending transactions to this smart contract address.

For instance, assume there is a smart contract code has been set with the condition that only A and B can withdraw a certain amount of money locked in the smart contract. If C tries to withdraw it, the transaction will be rejected. The code for this is clearly visible to the public, as all data is, and all nodes in the blockchain will run this transaction through the smart contract code. This eliminates the concerns around secretive and controlled nature of the application logic in traditional web applications.



## Pacts

A pact is a collection of data and functionaities related to one instance of an agreement between two or more parties. The data is stored mostly on the blockchain, mapped against a univerally unique _pactId_. The data structure of a pact varies from one pact type to other.


In the ChainPact ecosystem, each unit of agreement (between one or more parties), represented through independent or shared smart contract logic, is called a pact. Thus, a pact is a collection of data related to a certain pre-agreed workflow, combined with pre-coded smart contract functionalities that act on the data, in accordance with the workflow.
  

In the realm of blockchains, especially in the popular smart contract oriented ones like ethereum, writing and storing data is a very expensive operation. This is intentional, as replication and storage of data by every node in the network is an overall expensive event, in terms of infrastructure costs. Thus it is wise to codify business logic against clauses in the wordy version of the verbal contract. This should be done alongside minimal amount of key data recording. For instance, if the agreement is to get paid amount X on a date DT, then only X and DT should be recorded and the rest should be codified.

  
At this point, one may wonder the following:

- Can we convert plain human-readable language to codes?
- Should we store a PDF document on to blockchain and use that instead?

  
An important distinction between a human taking an action, and a smart contract doing it, is automation. If a certain condition could be automated into a smart contract, it becomes a trusted way to execute it, without any other dependencies. If X amount is meant for an account A, it can only be withdrawn by account A (using their wallet), without needing anyone sitting at any counter verifying any other documents.

  

## Pact types

It’s easy to see that unless the circumstances are dramatically different, most use cases can rely on standard set of codified clauses for standard agreements. The use of some parameterized conditions can give additional required flexibility to the pacts deployed as smart contracts.


Additionally, if someone tries to make a new smart contract every time, as a conversion from verbal language, it may contain errors or vulnerabilities. Smart contracts are unchangeable (fundamentally, but there are ways to make them upgradeable). And that means the vulnerabilities also remain alongside well-meaning code which can be exploited. Hence it is more convenient, wiser even, to have one smart contract code being shared, used, tested, fixed and distributed for a certain workflow. So, we create only a few varieties of pacts, opinionated and tested, to fit the needs of most people rather than everybody.

## Identifying a pact
The main identifier for any pact is the pactId field present in all of the ChainPact pact types. This is a 32-byte hash of all of the pact paramenters, the creator, the address of the smart contract, the pact counter. This generates a universally unique ID for the hash, for any pact on a certain chain (for all practical purposes).

The hash ensures that the data and access of each and every pact can be securely identified and processed by the blockchain.

The frontend comes with a functionality of locating a pact by its pactId and pact type, making it easy to share a pact with anyone

## Getting started

ChainPact currently lets you create two types of pacts, namely a Gig pact and a proposal pact. In order to create a pact you need a browser extension for a wallet app like Metamask. Head over to the [ChainPact dAPP](https://app.chainpact.xyz) and create a pact!