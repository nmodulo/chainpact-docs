# Chains and Tokens

## What are Blockchain networks

Blockchains are decentralized, distributed networks of data that guarantee some interesting properties, through cryptography. These properties are:

- Immutable and tamper-evident: the data that goes to the blockchain once, and is accepted by the network (which it is, if it is correct), it cannot be changed. By that we mean that a massive computational effort and cost would be required to make a calculation to produce a slightly different version of the blockchain, thanks to cryptographic hashes.
- Access and ownership oriented: Assets and data are owned by individuals through their cryptographic wallets. Making changes to them like modifying values, sending coins etc. can only be done by the owner. This is ensured with the use of digital signatures. Also the system, by design, cannot discriminate between wallet addresses, as against authoritative censors in traditional systems. A transaction will get through as long as it is mathematically correct.
- No centralized point of failure: Most blockchains rely on consensus of data between thousands of nodes, ensuring that a few rogue or unavailable nodes cannot bring down the entire network.

  
Every _node_ on the blockchain has a copy of the whole database (the blockchain, or just “chain”). All changes to this data is made through transactions, which are requests made to one of these nodes by an external device - a wallet or account. A transaction carries the data to be sent to or changed in the blockchain and the digital signature of the wallet that initiates it. If the wallet has access to the action this transaction is trying to carry out, it will be successful! 

## Supported networks

Currently, ChainPact is in alpha phase and has been deployed to major EVM-based testnets such as BNB Testnet, Avalanche Fuji and Polygon Mumbai. In future we wish to integrate with other EVM based chains as well as non-EVM blockchains.

## Supported Currencies

In order for real world use-cases to fit, the use of stablecoins is essential. That's the reason ChainPact aims to support major ERC-20 stable coins like USDC by Circle. We are in the process of integratng USDT and others.

## Wallets and Accounts

The blockchain works around public-key cryptography. An account is associated with an address - a mapping of the public key of a certain private (secret) key.

In simple terms, a very random number is generated as a secret by an individual and stored in an application called wallet. This secret is used to generate the address, which is used to refer to this wallet (associated with the secret). As long as the secret is not shared with anyone else, the account can only be operated by the wallet’s owner.
  
The wallet holder asserts identity using a digital signature: a cryptographic proof that a piece of data is being signed (or a transaction is being authorized) by the holder of the secret key associated with this account. 
  
An individual can generate as many accounts as they wish, without any trace or association with their previously generated accounts. However, since transactions can be traced, if a new account is used to transact with a smart contract or another account, an association can be inferred. Hence, accounts are pseudonymous and not anonymous.

In the ethereum-like ecosystems, the contracts themselves are accounts too, with balances, but without any associated secret key. The wallet account only operates in accordance with smart contract logic

