# Voting mechanism

## Other Existing Voting Patterns

Blockchain-based voting enables a more secure and decentralized voting setup. It is a common use case for Decentralized autonomous organizations (DAOs) which have been getting increasingly popular in the past few years. We explore the various mechanisms of voting participation, compare the voting strategy in proposal pact with that of existing standards.  

### Quorum voting  

It requires a certain threshold of voters in order for a proposal to pass. This could be in the number of voters or in terms of voting power. For instance, a 60% quorum of voters would mean at least 60% of all eligible voters must vote in order for it to be considered.Some (like Compound governance), however, use a voting power threshold. A 20% threshold means if 20% of voting power has voted positively, the proposal passes.


This is a straightforward and safe system as long a balanced quorum requirement is selected. A high quorum, which means a lot of users have to vote, may make proposals difficult to pass and hence slow things down. And a low threshold makes the system easy to attack by passing nefarious proposals quickly. Sometimes, though, voting could become a game of chasing “the whales” (accounts with high token balances)


Other challenges include difficulty in passing smaller less popular proposals (leading to a governance lock), tactical voting of alternatives to prevent or let a certain proposal pass instead of choosing one’s actual preference, the financial aspect of token price (since you need more tokens for more voting power)


### Holographic Consensus

The voters first stake tokens on the outcome of the vote (for or against) and then the result is arrived at using relative majority, without needing a quorum. This can incentivize voting on proposals, and reduce the risk of attacks. However, this too may suffer from tactical voting, and lead to forming social communities or groups before even a proposal is made or voting is started.


Further, this system is harder to understand for new people, leading to lessening of participation, slightly worse user experience, friction in processes, and cost in terms of educating users.


### Conviction voting

Individuals stake tokens on a certain proposal with a certain vote. Over time this preference gains more weight. When a vote is changed, it means sacrificing the accumulated weight on that vote. So, last minute vote hijacking by whales becomes difficult. This a representation of people’s long term faith in an idea. 


Although this mechanism can serve use cases like a long-term fundraisers, doing radical changes like addressing a bug, won’t be a suited use-case.
  

### Permissioned Relative majority

Relative majority means one vote is simply greater than the other. On a DAO, this could be easily attacked by passing a proposal silently which could lead to unwanted consequences for other members. Adding a layer of permissions, e.g. who can create a proposal, who can vote etc. and adding time-based protections can mediate the risks.

## Voting Mechanism in Proposal Pact

The proposal pact is meant for a more open audience than a fixed DAO pool of participants. Rather than executing DAO smart contract code, it is only meant for an opinion and fund collection tool.


If there is no voting, there is no funding for the proposal. The recipients of the collected funds are also pre-decided as “Yes Beneficiary(ies)” and “No Beneficiary(ies)” with the option of “Refund” on both of these cases.


It is expected that the most common use case - a fundraiser for a proposal - will designate the creator herself as the Yes Beneficiary and a “Refund” in case the proposal fails. All this information is clearly visible to anyone who wishes to contribute any amount. So, it is hoped a creator will make a favourable set of parameters to garner more public trust for an open participation pact


There are two types of voting a proposal pact can work with

- A fixed participants set - the creator preemptively defines the list of accounts that have voting power
- Open participation - all accounts that have contributed a certain minimum amount are allowed to vote


We propose the following protection for these use cases


### Voting start time is pre-decided

The voting start time is fixed for a proposal. This allows participants to plan better. One challenge will be to strike a balance between how immediately creators want their pact to be actively voted on, and what is a good buffer time before the voting starts. Currently, it allows voting to start immediately and hence can go “unnoticed” or pass “silently”.  
  

Although, since no external account or treasury is connected to a pact, and any participant will be able to see the voting start time while contributing, silently passed proposals would be virtually fruitless.
  

### Minimum voting period

This is a fixed check parameter (constant) hard-coded into the smart contract. Basically, the creator has to decide on the voting period at the time of creating the pact and must be higher than this minimum value. This is set to 12 hours (subject to change) for a fixed pool of participants and 24 hours for open participation.  
  

The rationale is that there should be enough time for others to react to a certain proposal to encourage or dissuade other participants. While, creators should get the chance to create a pact with a longer voting period, since open participants are more likely to contribute and cast a vote on a single session.
  

### Minimum participation amount

At the time of pact creation a minimum contribution amount is specified. This is the amount that a user must contribute to gain voting rights, both in fixed and open participation pacts.

However, for open participation, the creator must specify a certain non-zero contribution amount higher than fixed check parameter (constant) called MinOpenParticipationAmount. This ensures the pact can’t be attacked in a swarm.
  

### Voters can’t be changed dynamically

While the voting is active no change to the core data of the pact can be made. This includes the set of permissioned voters in case of a fixed participant proposal pact.