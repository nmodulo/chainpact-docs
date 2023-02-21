# Proposal pact

The objective for the proposal pact is to enable users to

- Simply create an immutable announcement for a cause on the blockchain - that is verifiable through the account address
- Have a mechanism to vote
- Collect funds on to the pact for the aforementioned cause
- Disburse the funds at the end of voting, with pre-announced beneficiary accounts

  

Through the frontend, the user should be able to create the proposal pact. In order to do this the user has the option of going to “Create a proposal pact” and enter the values in the form.

  

Afterwards, the user is presented with a pre-flight check - containing all the values filled in from before, so they could have a final look before going for “Looks good - deploy”

  

**THE DATA STRUCTURES**

| Contract side | Accessor and local | Data |
| --- | --- | --- |
| Map ( `pactId` → `PactData` )  <br>Stores/gets the core pact information, apart from votingInfo | For non-array data - `pacts(pactId)`   <br>For voters and beneficiaries -`getParticipants(pactId)`  <br>  <br>Stored in local in `proposalPacts[chainId][pactid]` \- contains pact data, array data, and votingInfo | ```<br>creator<br>totalValue<br>pactText, isEditable<br>groupName<br>yesVotes, noVotes isRefundAvailable<br>voters[] yesBeneficiaries[] noBeneficiaries[]<br>``` |
| Map ( `pactId` → `VotingInfo` )  <br>Stores/gets the voting related info in a single struct | `votingInfo(pactId)`  <br>Stored locally in `proposalPacts[chainId][pactid].votingInfo` | ```python<br>votingEnabled<br>openParticipation<br>refundOnVotedYes<br>refundOnVotedNo<br>votingConcluded<br>duration<br>votingStartTimestamp<br>minContribution<br>``` |
| Map ( `pactId` → (  <br> `address` → `PactUserInteraction`)  <br> )  <br>Stores user-pact interaction related data | `userInteractionData( pactId, address)`  <br>Stored locally within  <br>`proposalPacts[chainId][pactid].votingInfo` | ```<br>canVote<br>hasVoted<br>castedVoted<br>contribution<br>``` |
| Map ( `pactId` → grant amount )  <br>Stores how much grant is available for a beneficiary to withdraw | grants ( address )  <br>  <br><NOT STORED IN LOCAL YET> | If A is a beneficiary of say 10 ETH, then after the vote is over, grants(A) = 10 ETH.   <br>A then withdraws that, whence grants(A) becomes 0 |

  

**ACTIONS**

- createPact - create a new pact with the information passed in.
- setText - as the creator, edit the pact text of an “editable” pact
- addVoters - add a set of voters to a non-open pact, before the voting starts
- pitchIn - add funds to the pact to be disbursed to beneficiaries
- withdrawContribution - withdraw funds added by your own address/account before the voting starts
- postponeVotingWindow - as the creator of the pact, postpone the voting window by 24 hours
- withdrawGrant - withdraw grants allocated to your account/address, as a beneficiary
- voteOnPact - submit a yes or no vote (corresponding to a true or false value) to the pact
- concludeVoting - as an allowed voter, initiate fund disbursement after the voting is complete

  

**LOGIC AND RESTRICTIONS**

**Voting**

- The voting period defines whether voting is active. This period starts when the current block’s timestamp is greater than `votingInfo.votingStartTimestamp` The block timestamp is very close to the computer’s own timestamp, which is the current UTC unix time in seconds (not milliseconds)
- Enabling voting for a pact is optional, and this must be specified while creating a proposal pact. Without voting, the proposal pact is a mere micro-blog post on blockchain!
- The participation for voting can be open or fixed. In case of `votingInfo.openParticipation = true` a user must contribute a minimum amount, to guard against spamming. In case of fixed voters, only a fixed set of voters specified during pact creation, or added later before voting window starts, can cast vote.
- While creating a pact, `votingInfo.minContribution` can be set. A user with contribution less than this won’t be allowed to cast vote. 
- The active voting window lasts for `votingInfo.duration` . Thus, eligible voters won’t be allowed to vote at timestamp higher than `votingStartTimestamp + duration` . 
- An eligible voter for openParticipation pact is anyone who has a contribution greater than `pactInfo.minContribution` . This value will always be non-zero.
- For a pact with fixed set of voters, any address in the `pactData.voters[]` is eligible to vote once, as long as their contribution is greater than or equal to `votingInfo.minContribution` which in this case can be zero.
- After the voting window is over, all of the pact’s value, stored in `pactData.totalValue` is eligible to be transferred to the beneficiaries. The beneficiaries are specified either as fixed, or with the option of a refund.  
    
- If the number of yesVotes (vote sent with vote = true) > number of noVotes ( vote = false ) then the fund gets divided among all addresses in `yesBeneficiaries[]` , or if the `refundOnVotedYes == true`  then all contributors can get their money back using `withdrawContribution()` . If `noVotes >= yesVotes` then the totalValue gets divided to all addresses in `noBeneficiaries[]` or the option to refund is activated if `refundOnVotedNo == true` 
- The `concludeVote()` method must be called by one of the eligible voters after the voting window is over for the totalValue of the pact to be added to the `grants` map in the smart contract. This isn’t done automatically, or even at the last eligible person’s vote.

**createPact**

- The following data is sent to the smart contract for creating a new pact

    - votingInfo (the entire set), 
    - isEditable (true or false), 
    - pactText (combined title and description, with a ‘</>’ separator, if applicable)
    - Arrays - voters, yesBeneficiaries, noBeneficiaries
    - (optional) a value added to the transaction, that gets locked into the pact

- The unique id (pactId) is calculated by the smart contract as a keccak256 hash of the following information:  
    
    address of the smart contract,
    
     sender/creator address,
    
     the string "chainpact\_proposalpact",
    
     pactsCounter (auto incrementing counter counting the number of pacts created thus far)
    
      
    
- If votingInfo.votingEnabled is sent as false, the entire votingInfo object is ignored
    
- If voting is enabled, the votingInfo related restrictions apply
    
- For an openParticipation pact, this must be set higher than a fixed parameter - `config.minOpenContributionAmount` . This value is present in the pact’s config parameters, and also ported to the frontend.  
    
- The duration must be higher the 
    
    `config.minOpenParticipationVotingPeriod` for an openParticipation pact and higher than `minOpenParticipationVotingPeriod / 2` for a fixed voters pact. The duration cannot be longer than 
    
    `config.maxVotingPeriod` 
    
      
    
- If voting is enabled, the yes and no-beneficiaries must be specified
    

    - if `votingInfo.refundOnVotedYes == false` the `yesBeneficiaries[]` should be a non-empty array
    
    - similarly, if `votingInfo.refundOnVotedNo == false` the `noBeneficiaries[]` should be a non-empty array
    

- For it to be honoured, the `votingStartTimeStamp` can specified greater than the (possible) timestamp of the block in which the transaction is included. Otherwise a `block.timestamp + 30*60` is stored as the votingStartTimeStamp. This is to give eligible voters at least a 30 - minute grace window before the voting even begins.

  

**postponeVotingWindow**

- Pushes the votingStartTimestamp to 24 hours further, by adding 24\*60\*60 to it
- Can be performed by the creator before the voting starts, on a pact with voting enabled

  

**addVoters**

- Voting shouldn’t have started yet, and voting should be enabled for the pactId
- Only the pactCreator is allowed to perform this on a pact that isn’t openParticipation
- Voters can be added even with pre-existing voters in the pact

  

**pitchIn**

- Can be used by anyone on any pact, as long as the voting is enabled and hasn’t been concluded on it

  

**voteOnPact**

- Will revert if the voting isn’t active or the account has already voted (`userInteractionData.hasVoted`)
- The account must either have `userInteractionData.canVote = true` or the pact should be openParticipation
- The account must have a contribution greater than `votingInfo.minContribution`

  

**concludeVoting**

- The voting must have started and ended that is: 
    
    `block.timestamp > votingInfo.votingStartTimestamp + votingInfo.duration` and voting is enabled
    
- The account must have the same set of voting rights as mentioned earlier
    
- This sets the `votingInfo.votingConcluded` to `true` and thus cannot be called a second time
    

  

**withdrawContribution**

- Voting must not have started, and the amount being asked is less than or equal to their contribution amount