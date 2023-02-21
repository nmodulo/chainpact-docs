## SWC Registry Checklist

Following is our point-by-point analysis of known SWC registry vulnerabilities and our comments/remediation

SWC-100
Function Default Visibility
All functions have explicit visibility

SWC-102, 103
Outdated Compiler Version, Floating pragma
Version fixed at 0.8.16

SWC-104
Unchecked Call Return Value
all external interactions are checked for return values

SWC-105
Unprotected Ether Withdrawal
All ether withdrawals are check with checks-effects-interaction pattern. Initializers are disabled for logic contract, and are protected for proxy contract

SWC-106
Unprotected SELFDESTRUCT Instruction
No Selfdestruct instruction anywhere in the code. Initializers absent on libraries, and disabled on logic contract


SWC-107
Reentrancy
All internal state changes are performed before the call is executed.
Only external calls are in ERC-20 token transfers (to watch out)
Delegatecalls restricted to own library functions
Value payments are made through tranfer or send only

SWC-108
State Variable Default Visibility
All state variables are explicitly labeled with visibility

SWC-112
Delegatecall to Untrusted Callee
Not present

SWC-113
DoS with Failed Call
Pull payments are used for mass payments. Array sizes are limited everywhere.

SWC-114
Transaction Order Dependence
Timestamps and orders are treated in a non-urgent manner in the architecture. Meaning, a block has a single timestamp that decides order precedence and the risk of a race condition is avoided. Moreover the code doesn't have any first-come-first incentives. Collisions in UID fields are directly avoided by explicit condition checks, and there is no reward for getting to any point first. Most parameters are pre-decided.

SWC-115
Authorization through tx.origin
Not present

SWC-116
Block values as a proxy for time
Precise time is irrelevant in the system. Approx time is good enough

SWC-119
Shadowing State Variables
Not present

SWC-120
Weak Sources of Randomness from Chain Attributes
Collision checks have been implemented to avoid any issues

SWC-121, SWC-122
Missing Protection against Signature Replay Attacks, Lack of Proper Signature Verification
Signatures are dependent on pact parameters that are guaranteed to change.
msg.sender checks exists and one could only submit their own signature
Signatures submitted are verified separately using ecrecover

SWC-123
Requirement Violation
Inputs are validated wherever applicable

SWC-124
Write to Arbitrary Storage Location
Data structure is maintained at one place, with proper access restrictions and abstraction

SWC-126
Insufficient Gas Griefing
TODO - Check how much gas ERC-20 transfer operation requires and place restrictions

SWC-136	Unencrypted Private Data On-Chain
NONE

SWC-135 Code With No Effects
Unit tests written, more being written and verified


SWC-134	
Message call with hardcoded gas amount
NA

SWC-133
Hash Collisions With Multiple Variable Length Arguments
Not present, managed with access restrictions

SWC-132	
Unexpected Ether balance
Strict equality checks on balances not present in the code

SWC-131	
Presence of unused variables
Not present


