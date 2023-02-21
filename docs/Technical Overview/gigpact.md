# Gig Pact

The gig pact is a smart-contract representation of a usual work contract. It can be used in scenarios where one party is the payer and the other party delivers some goods or services, while being paid in hours. The end to end lifecycle of the pact is captured through parameters of the gig pact, and a `pactState` parameter which can be seen as checpoints like "Employee has signed", the pact is "Active" or "Ended" etc.

## Parameters

In the Gig pact smart contract the following core parameters represent a pact at the time of creating it are stored

| Parameter | Description |
| --- | --- |
| `pactName` | Represents a 32-character reference title for the pact, e.g, “Web design pact” |
| `employee` | The account address of the employee/seller/service provider |
| `employer` | The account address of the employer/buyer/payer |
| `payAmount` | The amount to be paid in the pay cycle. To be represented in native digits of the currency, and not a floating point |
| `payScheduleDays` | The pay cycle - the number of days the `⁠payAmount` should be paid in |
| `employeeSignDate` | The unix time in seconds at which the employee signed the pact |
| `erc20TokenAddress` | Address of the external smart contract for the the paying currency. For instance if the paying currency is USDC, it should be the address of the USDC contract on the network that this pact is created in. |


## Signature

On the frontend, both the parties must sign the combined hash of these parameters, as an added proof of acknowledgement. The function to calculate the hash is present in the smart contract itself, to avoid confusion. This hash is pulled from the contract using a (view) call to the smart contracts `contractDataHash` function.

This signature should be verifiable both on and off the chain. In order to verify the signature, one has to generate the solidity hash of the parameters, by replicating the functionality present on the hash generating method. The original signer can use regenerate the ECDSA signature, and it will match


## Pact's current status or state

The current status of the contract is represented by `⁠pactState` variable stored along with the rest of the parameters. It can take the following values 

| Parameter | Description |
| --- | --- |
| DEPLOYED | The pact has been created. By default all existing and future pacts are in this state.
| RETRACTED | The employer has retracted the pact and has collected a refund of the staked amount
| EMPLOYER\_SIGNED | The employer has signed the contract first and staked the first pay amount into the pact. The pact can still be retracted after this.
| EMPLOYEE\_SIGNED | The emloyee has signed the pact first. The pact cannot be retracted by the employer.
| ALL\_SIGNED | Both the parties have signed the pact. The pact can now be started.
| ACTIVE | The pact has started and a clock to the assumed due pay will be calculated based on time elapsed since ACTIVE
| PAUSED | The pact has been paused by the employer. The clock for assumed work hours pauses when this is invoked
| TERMINATED | The employer has terminated the pact and got the refund of ` stakeAmount - paymentDue `
| RESIGNED | The employee has invoked a termination on the pact
| FNF\_EMPLOYER | The employer has sent the full and final settlement (zero or more) from their end indicating that all due payment is complete from their end
| FNF\_EMPLOYEE | The employee has sent the full and final settlement from their end indicating that the employer doesn't owe them anything.
| DISPUTED | The employee has raised a dispute, along with a suggested amount that the employer presumably owes them.
| ARBITRATED | Both the parties have agreed on one or more third party wallet address to mark the dispute as resolved, after arbitrating
| FNF\_SETTLED | Both the parties have sent their FnF settlement transactions, indicating nothing is owed to the any party
| DISPUTE\_RESOLVED | The selected arbitrators on a disputed pact have unanimously marked the dispute on the pact as resolved
| ENDED | The pact lifecycle has ended and no more transactions can be made on it