# 12LE - Testing I

## Bugs and defects

### Definitions
`Bug` - Consequence of a coding error
`Defect` - Inability of software to meet requirements of the system

## Debugging

**Debugging is NOT testing.**

- If you don't detect a bug then there is not debugging to do
- With debugging, there is often no particular view of the requirements or the design

It is the process of finding the cause of a bug.
Testing involves validation and verification. Debugging is a consequence of testing, it is not testing itself.

## Testing Models

### Bezier Model

Level 0: No difference between testting and debugging
**Level 1: Purpose of testing is to show that software works**
**Level 2: Purpose of testing is to try to attempt to show that software doesn't work**
Level 3: Puprpose of testing is to reduce any risks relating to the use of software
Level 4: Testing is ingrained as a mental discipline for all IT

**This project should focus on L1 & L2**

### Based on Software Development Lifecycle
![](https://i.imgur.com/iKK8eWN.png)

#### Validation
- The process of determining whether software meets a requirement.
- "Are we building the right product?"

#### Verification
- The process of determining whether software is build in the right way
- "Are we building the product right?"

### Test Plans
- Basis for describing how a software product is tested
- Master Test Plan (high level document that unifies phase test plans)
- Phase Test Plans (concerned with the different types of testing)

### Test Scenario
- Any functionality that can be tested: e.g. *Test the Login Function*

### Test Case
- Defines the conditions of the test that determine if a set of requirements are met e.g. 
    - *Check system behaviour when a valid user ID and password is entered.*
    - *"Check system behaviour when an invalid user ID is entered with a valid password."*
    - *"Check system behaviour when a valid user ID is entered with an invalid password."*

### Test Scripts
- Code that implements the test
- The creation of any given test script is no guarantee that faults will be revealed even where Test Driven Development practices are mature

## Types of test

 

## Unit Tests

