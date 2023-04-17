# Creating a Gig Pact



A gig pact is a representation of how usual employment agreements are made. This can be used for making a freelance contract, freelancer agreement, independent contractor agreement etc. on the blockcain.

Typically, a work contract of this form is drafted with the terms put in a piece of paper. With ChainPact, we will be assuming the real-world conditions are taken care of by the parties off-chain. So, the Gig pact really is just a periodic payment agreement that escrows in the supposed payment amount.

Let's assume Bob is a web-designer and wants to work for Alice, the employer. The pact will represent an example workflow of the steps in this setup

``Note: The validity of gig pact in a court is jurisdiction dependent and we don't intend to replace any part of law here.``

Either parties, or anyone else, can "create" the pact with the parameters. Before starting, ensure you have enough balance on the wallet to pay for transaction.

 - Alice drafts and enter the details of the pact
 - Alice uses "Sign as Employer" option to put in her wallet's signature on the pact, while also staking the "Pay Amount"
 - Bob signs the pact using "Sign as Employee" option
 - Alice starts the pact, after which it becomes `ACTIVE`
 - Alice approves payment that reaches Bob's wallet directly
 - Alice decides to terminate the pact
 - Bob acknolwdges the termination, and Alice reclaims staked amount, after which the pact reaches its final state `ENDED`

## Connect wallet to the dApp

For the sake of this example we will be using Avalanche Fuji testnet. Other supported networks can be found in the [Supported Networks](/blockchains/) section. 
Visit [app.chainpact.xyz](https://app.chainpact.xyz) and click on "Connect Wallet". This will prompt you to approve connection from your Metamask wallet, or send you over to Metamask's install site. 
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/connect-metamask.png" alt="connect metamask" style="width:300px;"/>
<img src="/assets/approve_metamask_connect.png" alt="connect metamask approve" style="width:200px;"/>
</div>

<div style="display:flex; justify-content:center; align-items:center; width: full; padding: 2rem; gap:2rem">
<img src="/assets/wallet-connect.png" alt="connect metamask approve" style="width:200px;"/>
You can also use WalletConnect to sign in using a wallet app on your phone by scanning the QR code shown on clicking "WalletConnet". Though sometimes this causes issues if you don't have the desired network already present in the list of networks in Metamask app
</div>

If you don't have enough test balance for this example, you can go to Avalanche Fuji testnet faucet and get some free coins.

After having connected the wallet to the app, you will be greeted with the welcome dashboard. Feel free to rename it from Anonymous to "Alice"
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/dashboard-ss.png" alt="alice dashboard" style="width:700px;"/>
</div>

## Creating the Pact

Click on Create a Payment Agreement on the dashboard and you are presented with a form to enter the parameters.
We enter the name "Web design by Bob", Bob's wallet address as employee wallet address, Alice's address as the employer's address.

For the pay amount we can choose a currency. Since Alice wants to make the payments of 10 USD with the USDC stable coin, we choose USDC from the dropdown. This payment will be made weekly, so we choose Pay Schedule as 7 days.

<div style="display:flex; justify-content:center; width: full">
<img src="/assets/gigPact/gig_pact_edit_draft.png" alt="Drafting Gig pact" style="width:500px; align:center"/>
</div>


Further, Alice decides to add some textual information about the scope of this agreement. This is stored locally on Alice's browser and not synced with ChainPact, Blockchain or any other service. So this remains private. One way to share that would be to use the Email share option after the pact is deployed.

Next, we are presented with a pre-flight check screen to verify the details before submitting it to the chain. We click on "Looks Good - Deploy" to submit and create the pact
<div style="display:flex; justify-content:center; width: full">
<img src="/assets/gigPact/gig_pre_flight.png" alt="Pre-flight Gig pact" style="width:600px;"/>
</div>


## Signing and locking funds
Alice and Bob can sign it in any order - Bob first or Alice first. But since Alice is the one supposed show that she has enough funds to support the first payment, Bob may only agree to complete the gig work after Alice stakes in the first payment.

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

On the course of the agreement between Alice and Bob, they need to take several actions to fulfill this payment  agreement.
Following actions can be taken on the pact

- Start Pact: Alice can start the pact whenever the gig is ready to begin. Once started the pro-rata payment measurement also begins. Meaning, if the pact was started today, in 3 and a half days, half the payment (i.e. 5 USDC) would be the assumed payment due
- Approve Payment: Alice can use this option to transfer funds through the pact to Bob. The payments are made in the curency of the pact.
- Pause: Either of the parties can use this option to stop the pro-rata payment calculation clock. The duration the pact was paused is subtracted while calculating the due payment in next courses of actions and milestones on the pact.
- Resume: Either of the parties can use this option to restart the pact. The pro-rata payment clock begins counting again.
- Resign: Bob can use this option as the employee to break off the pact. As soon as this option is excercised, part of the stake amount minus the pro-rata payment at this point, is refunded back to the employer. The pact state changes to `RESIGNED`
- Terminate: Alice can use this option as the employer to end the pact. Again, the stake amount is refunded to Alice and the pact changes to a `TERMINATED` state
- Full and Final settlement: After the pact is in `RESIGNED` or `TERMINATED` state, both parties must use the FnF option to indicate sending any remaining amount due to the other party. For instance, say Alice still owes Bob $5, she must send this money to Bob, specifying this amount in the FnF dialog box. The state will change to `FNF_EMPLOYER` or `FNF_EMPLOYEE`, then to `FNF_SETTLED` with this option
- Reclaim stake - This is the final move by Alice to reclaim the remaining stake on the pact after it is in `FNF_SETTLED` state
