# Creating a Proposal Pact

A proposal pact enables a user to create a proposal on blockchain that users can contribute to and vote on. An example use case of this could be a fundraiser. One added feature in the proposal pact is that of voting. The voters can be an open set of participation with a minimum contribution, or a fixed set of accounts pre-decided by the pact creator.

For this example, let's say Alice wants to raise money for a tree plantation drive nearby. All she needs is a funding of USD 1000 for the expenses in the effort. She not only aims to raise the funds, but also wants to collect opinions of people through voting.

Alice will create and manage the pact in the following steps:

 - Chooses an account with enough native balance to pay for transactions
 - Enters a short summary and and external URL into the pact text while drafting the pact
 - Decides on minimum contribution, a suitable date and time to start voting, and creates the pact
 - Shares the pact URL on social media to gather attention, as the voting gets active
 - Collects the gathered fund after the voting period

## Wallets and balances

See [Wallets and balances](/creating_gig_pact/#wallets-and-balances)

## Create Proposal Pact flow

### Alice's venture - Ovo
Let's assume Alice wants to build a new open source voice assistant called "Ovo". She has created a proposal and now wants to put it out there to collect some funds from interested folks.

On Alice's part, she wants to be sure that these contributors do pledge funds before she spends her own time and resources to complete the first prototype. While on the contributors part, they want to make sure that Alice completes the expected prototype within a given time frame, and that the funds are refunded back to them if she fails to do so.

### Drafting the pact
Alice publishes the details of her proposal to a github link, and sets a 30-day period before the final evaluation of her prototype. Meanwhile, contributors can fund the initiative. As a first step she types in the details on the Create Propoal Pact form as below

<img src="/assets/proposalPact/PP_Form.png" alt="proposal pact form" style="width:700px;"/>

The title is a string (short, desiredly) describing the intent of the proposal and rest of the details go in the "Description". Currently the app supports pulling data from github (the .md readme files, for example) and displaying it in the description. Since storing data on the blockchain is expensive, it is recommended that only the URL of this description be put into the form as shown.

Selecting "Open Contribution" here for the voters allows anyone at all to contribute to the pact and vote on it, as agains "Fixed Voters" which only allows a pre-selected list of accounts. To mitigate abuse of voting power, a min contribution should be given to the pact.Alice selects a minimum contribution amount of 0.1 AVAX which she thinks isn't large enough to dissuade small contributions.

The start time is kept about 30 days from today, as agreed by most of initial contributors offline. And the result of voting would send all of the funds in the pact to to a pre-selected account specified under "If yes vote wins". If a majority of contributors vote "NO" to the proposal, all the funds are refunded, and can be withdrawn. This is speciied with the "Refund conributors"

After this there is a step for pre-flight check to ensure all entered details are correct before putting it to the chain. On clicking "Looks Good - Deploy", the data for the pact is sent as a transaction to the blockchain, with the currently selected account (the Metamask wallet, for example) as the "creator". In this case, let's assume the wallet address in the illustrations here is that of Alice.

<img src="/assets/proposalPact/pp_preflight.png" style="width:700px; justify:center" />


### Pact details
The pact can now be seen in the "Saved" pacts in the My pacts section. Clicking on the title opens up a details screen that shows all of the details of the pact including transactions. This is illustrated below

<img src="/assets/proposalPact/pp_details.png" style="width:700px; justify:center" />

There are several options at Alice's disposal which can be achieved by clicking on the options button on the top right of the pact's box

<img src="/assets/proposalPact/pp_options.png" style="width:200px; justify:center" />

With the option to "Postpone Voting window", the voting start time can be postponed by 24 hours by Alice before the voting starts.