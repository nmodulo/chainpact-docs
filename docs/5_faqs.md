# Frequently Asked Questions

Here is a gist of some of the questions we get asked often

### What is the current state of the project

Currently we have deployed a pre-alpha version of the app with two ready-to-use pact types: Gig pact, and Proposal Pact.We have only deployed it on the testnet, as we must finalize a lot of things and get external contract edit before going life. 
If you are someone who has experience with solidity smart contracts, you are very much welcome to look through the code yourself and raise an issue in the [smart contracts repository](https://github.com/nmodulo/chainpact)

We are actively working on understanding the needs of potential users and improving the flows in the smart contract. Help us with your thoughts and insights by joining [our discord](https://discord.com/invite/6mAzebvpsQ)

### Is ChainPact compliant with the law for contracts?

ChainPact provides a window to a very niche use case: time-based automated payment agreement between two or more parties, including voting and third-party involvement. The underlying smart contracts only understand numbers. Any pact created is only as compliant as the purpose it is being used for, and any other external verbal or legal concern being addressed by associated parties.

In that, by argument, ChainPact is indiscriminate. ChainPact smart contracts, however, don't have any human-readable rules that is verified by the smart contracts. Any verbal data input by any account is completely under control of the account and can't be helped by anyone else (that's web3, remember?)

### Why is there a tiny commission?

We need to keep the infrastructure running, and make sure the application is bug-free. We maintain the running costs with a tiny 0.5% commission.



## Gig Pact

### Can one of the parties refuse to sign it, and then the offer is gone?

Any one of the parties (employer or employee) can draft the parameters of the pact (payAmount, wallet addresses etc.) and deploy it. The URL/QR Code/Pact ID of the pact can then be shared with the other party, off the chain (email or instant messaging).

When the employer signs the pact, he/she does it along with staking in the ``payAmount``.  The employee can refuse to sign it, and the employer can RETRACT the offer by going under "Additional Actions" and get a refund.

On the other hand if employee or any other party drafts and deploys the pact, signs it, and the employer refuses to sign it, nothing happens. The pact data stays on the blockchain.

###  How do I stop the pact after it is active
An active pact can be ``PAUSED`` or ``TERMINATED``. Pausing stops the timer on the due payment for the employee that is calculated on a pro-rata basis. For instance, if the ``paySchedule`` is of 7 days and the pact is ``paused`` for 2 days, the pro-rated payment will be that of 5 days. This is the amount that stays locked in after terminating, and only refunded to the employer after ``FnF`` settlement.

If the employee chooses to ``terminate`` the pact goes in to the ``RESIGNED`` state while it goes to ``TERMINATED`` if the employer does it, with the same effect.

### What are the pitfalls you aren't advertisizing?
Here are a few things that may concern you

- Blockchains and smart contracts are still software, and like any other software it may have bugs. With a public blockchain, such bugs can be exploited easily if they are found by malicious parties. Such occurrences are rare but they do occur.

- The dApp is mostly browser-based and decentralized, we hardly collect any personal data at all (unless you force-feed us that data). This means there won't be any customer support or account linking. If you lose track of your pacts or transactions, you will have to find it yourself! Also, if you lose your wallet or your private key, we can't help you!

- One of the parties can do a suicide foul-play and nothing stops them. The whole idea is that if one of the parties performs an action in bad faith, it creates a lose-lose situation for both the parties. But the extent of personal finance impact for, say, $1000 can be different for either parties.

### Are there other apps that are doing the same?
Not really, there have been attempts at these that we are aware of, but we do aim to be unique in our approach to solving the domain of the problem.

### What if the freelancer is a bad actor?
Assuming a freelancer is the ``employee`` they may promise to deliver some goods or services in exchange for a payment through the Gig pact. Assuming they don't deliver it at all (or be a bad actor), they shouldn't get any payment at all without the  ``employer`` doing an ``approvePay`` on the pact. 

Even if the pro-rated payment reaches close to 100% and ``terminating`` the pact doesn't result in a significant refund to the employer, the employee doesn't get anything without the employer approving it. That amount just stays locked in to the pact.

It is advisable to do a regular check-in with the other party and hit ``terminate`` as soon as possible, if the need be.

