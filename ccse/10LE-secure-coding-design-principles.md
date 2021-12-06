# 10LE - Secure Coding Design Principles

## Economy of Mechanism
Reducing the attack surface
![](https://i.imgur.com/v0PI4ET.png)

---

## Failsafe Defaults
Adopting a “defensive programming strategy” ensures that fault conditions (or “exceptions”) are identified and appropriately handled.

#### Design Strategies:
- Fail Closed
    - If fails, provide no access, dont try to think about access or recovery, just lock it down
- Fail Open
    - If fails, provide open access

#### Coding Strategies: 
- Terminate the application
- Catch the exception and attempt recovery within code block
- Catch the exception and return to the calling method

## Complete Mediation
Complete mediation relates to the checking of credentials for each and every request for access

While the method of checking access may change, it is unsafe to perform no checks whatsoever

Failure to implement such checks can lead to 
- Race conditions (time of check / time of use)
- Insertion attacks
- Replay attacks

Types of checks include:
- Proof of the identity (login ID/password)
- Session token/authentication cookie
- Claim / role membership

![](https://i.imgur.com/uYdzqbS.png)

## Open Design
![](https://i.imgur.com/YYvkusx.png)

Security through obscurity is an absolutely terrible idea. Just don't do it.

## Least Privilege

Processes should only have the privileges (“permission to perform an action”) required to do the job for which they have been authorised.

![](https://i.imgur.com/2wGYa7H.png)

## Separation of Privilege

A privileged operation should not be granted based on a single condition but must satisfy multiple conditions

For example:

- Dual control systems
- Process workflows
- Multi-factor authentication
- Web application security controls based on source IP address and user authentication
- Linux sudo command: requires password + configuration in sudoers


This is also known as **defence-in-depth**

## Least Common Mechanism
Limit the resources that could be potentially shared by multiple processes/users

For example:

- Guest accounts / shared accounts
- Storing sensitive files in `/tmp` folder
- Network management VLANs shared with user traffic

## Psychological Acceptability
Users will find any way to defeat unacceptable/disruptive security controls 

Example:
Overly agressive policies on screensaver timeout deployed on an MS Windows system can be bypassed by running a minimised Windows Media Player window 

## Exception Handling in Code

Most (all?) high level languages support the “try - catch -finally” construct to allow exceptions to be handled directly within the method
![](https://i.imgur.com/navF06p.png)

Many languages also support declaring the exceptions that the method will “throw” back to the calling method –i.e. the caller takes responsibility for deciding the course of action
![](https://i.imgur.com/8jOppAn.png)    