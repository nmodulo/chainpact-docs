# Creating a Gig Pact

A gig pact is a representation of how usual employment agreements are made. So, in this article we will take the example of a web-design freelancer Bob working for a multinational company owned by Alice. We will create this employment agreement on blockchain as an automated workflow of the various steps of a typical contract.

Note: The validity of gig pact in a court is jurisdiction dependent and we don't intend to replace any part of law here.

Alice and Bob will create and manage the pact in the following steps:

 - Choose an account with enough native balance to pay for transactions
 - Alice drafts and enter the details of the pact
 - Sign the pact: both Alice and Bob have to put their signatures
 - Alice starts the pact, when it becomes Active
 - Alice approves payment that reaches Bob
 - Alice decides to terminate the pact
 - Bob acknolwdges the termination, and Alice reclaims staked amount

## Wallets and balances

For the sake of this example we will be using Avalanche Fuji testnet. Other supported networks can be found in the [Supported Networks](/blockchains/) section. Visit [app.chainpact.xyz](https://app.chainpact.xyz) and click on "Connect Wallet". This will prompt you to approve connection from your Metamask wallet, or send you over to Metamask's install site. 
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/connect-metamask.png" alt="connect metamask" style="width:300px;"/>
<img src="/assets/approve_metamask_connect.png" alt="connect metamask approve" style="width:200px;"/>
</div>



<div style="display:flex; justify-content:center; align-items:center; width: full; padding: 2rem; gap:2rem">
<img src="/assets/wallet-connect.png" alt="connect metamask approve" style="width:200px;"/>
You can also use WalletConnect to sign in using a wallet app on your phone by scanning the QR code shown on clicking "WalletConnet".
</div>

If you don't have enough test balance for this example, you can go to Avalanche Fuji testnet faucet and get some free coins.

After having connected the wallet to the app, you will be greeted with the welcome dashboard. Feel free to rename it from Anonymous to "Alice"
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/dashboard-ss.png" alt="alice dashboard" style="width:700px;"/>
</div>

## Creating the Pact

Click on Create a Gig Pact on the dashboard and you are presented with a form to enter the parameters.
We enter the name "Web design by Bob", Bob's wallet address as employee wallet address, Alice's address as the employer's address.

For the pay amount we can choose a currency. Since Alice wants to make the payments of 10 USD with the USDC stable coin, we choose USDC from the dropdown. This payment will be made weekly, so we choose Pay Schedule as 7 days.

<div style="display:flex; justify-content:center; width: full">
<img src="/assets/gigPact/gig_pact_edit_draft.png" alt="Drafting Gig pact" style="width:500px; align:center"/>
</div>


Further, Alice decides to add some textual information about the scope of this agreement. This is stored locally on Alice's browser and not synced with ChainPact, Blockchain or any other service.

Next, we are presented with a pre-flight check screen to verify the details before submitting it to the chain. We click on "Looks Good - Deploy" to submit and create the pact
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/gigPact/gig_pre_flight.png" alt="Pre-flight Gig pact" style="width:600px;"/>
</div>


## Signing and locking funds

The pact is now created and Alice needs to sign it from her end. While signing the pact, the agreed upon pay amount needs to be locked in to the pact. Alice ensures that she has more than 10 USDC in her wallet by clicking on the balance indicator on the top right.
<div style="display:flex; justify-content:center; width: full"><img src="/assets/gigPact/balance_pop_up.png" alt="Drafting Gig pact" style="width:500px; marginX: auto"/>

</div>

Alice proceeds to sign the pact by clicking on "Sign as Employer". The app presents a popup containing the core details of the pact. The hash of this transcript must be signed by both parties. This signifies clear acknowledgement of the pact. She verifies the details presented on the popup, and proceeds to sign, and the submit the signature.
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/gigPact/sign_as_employer.png" alt="Sign As employer popup" style="width:350px;"/>
</div>



## Sharing 

<div style="display:flex; justify-content:center; width: full; padding: 1rem; gap:1rem">
Alice then shares the url for the pact, that now lives on blockchain, to Bob for quick and easy access. Bob receives the latest status of the pact and proceeds to sign the pact as well.

<img src="/assets/gigPact/gig_share.png" alt="Drafting Gig pact" style="width:300px;"/>
</div>


## Actions

On the course of the agreement between