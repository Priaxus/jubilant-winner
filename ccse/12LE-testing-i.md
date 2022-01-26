# 12LE - Testing I

## Bugs and defects

### Definitions
- `Bug` - Consequence of a coding error
- `Defect` - Inability of software to meet requirements of the system

## Debugging
**Debugging is NOT testing.**

- If you don't detect a bug then there is not debugging to do
- With debugging, there is often no particular view of the requirements or the design
- It is the process of finding the cause of a bug.
- Testing involves validation and verification. 
- Debugging is a consequence of testing, it is not testing itself.

## Testing Models

### Bezier Model
| Level | Description                                                                    |
|:-----:| ------------------------------------------------------------------------------ |
| 0     | No difference between testing and debugging                                    |
| **1** | **Purpose of testing is to show that software works**                          |
| **2** | **Purpose of testing is to try to attempt to show that software doesn't work** |
| 3     | Puprpose of testing is to reduce any risks relating to the use of software     |
| 4     | Testing is ingrained as a mental discipline for all IT                         |

**This project should focus on L1 & L2**

### Based on Software Development Lifecycle
![](https://i.imgur.com/iKK8eWN.png)

#### Validation
- The process of determining whether software meets a requirement.
- "Are we building the right product?"

#### Verification
- The process of determining whether software is build in the right way
- "Are we building the product right?"

### Definitions

#### Test Plans
- Basis for describing how a software product is tested
- Master Test Plan (high level document that unifies phase test plans)
- Phase Test Plans (concerned with the different types of testing)

#### Test Scenario
- Any functionality that can be tested: e.g. *Test the Login Function*

#### Test Case
- Defines the conditions of the test that determine if a set of requirements are met e.g. 
    - *Check system behaviour when a valid user ID and password is entered.*
    - *"Check system behaviour when an invalid user ID is entered with a valid password."*
    - *"Check system behaviour when a valid user ID is entered with an invalid password."*

#### Test Scripts
- Code that implements the test
- The creation of any given test script is no guarantee that faults will be revealed even where Test Driven Development practices are mature

## Types of test
| Type of test | Purpose                                                                                                                                                                                                   | Performed by                    |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| UNIT         | Deals only with testing the internals of a method<br>Does the method behave correctly under different conditions?<br>The external environment or resources is not a concern of the Unit test              | Developers                      |
| Functional   | Tests a specific piece of software functionality such as a login function, payment function etc.                                                                                                          | Developers/Project Team         |
| Integration  | Integration testing is designed to test the overall architecture as communication flows across the system                                                                                                 | Developers/Project Team         |
| System       | Involves testing of the whole system<br>System testing is essentially "black box" testing<br>The internals of the application are not under test here but the capabilities as a whole are considered here | Quality Assurance/Security Team |
| Acceptance   | Various types of acceptance testing exist: User acceptance testing, Performance testing, Deployment Testing, Release Testing, Security certification                                                      | Stakeholders                    |
 

## UNIT Tests

### Introduction and Explanation
- The main code base and the scripts are located in separate folders within the project
- Typically, each code file will have a corresponding test file
- Each method in the code file is typically associated with one or more tests
- Unit tests should not require the application to be started. If necessary, the testing framework is responsible for creating an application context
- Stubs are used to setup necessary dependencies needed by the unit test (such as global settings)
- Mocks are fake objects that exist outside of the module (e.g. filesystem objects, database or network connections)

### UNIT Testing vs Integration Testing

- Unit tests are simply trying to determine behaviour, external components are usually faked (or "mocked")
- Characteristics of UNIT testing
    - Should not access the file system
    - Should not access the database
    - Should not Communication across the network
    - Should be executable in parallel with other UNIT tests
    - Should not require changes to configuration files
    - Should not require the entire application context to be started
- If your tests don't follow the above, they are most probably integration tests and not UNIT tests

**What is the point in unit testing if we know everything is going to be tested in the system tests?**

- Early testing saves money
- Gives a better understanding of code internals
- Stronger cohesion between code and use cases

## Test Driven Devlopment (TDD)
Method of developing code that involves creating the test before writing module.
- Tests scripts are designed according to the "Triple A" pattern
    - Arrange the code to setup the test
    - Act - invoke the test
    - Assert - check whether the expectations are met.
- Create the test first and then begin the cycle of introducing code into the code base and refining the code and the test until the code section is complete.
- Goal is that all lines of code are covered by a test - arguable whether this is achievable or even desirable

### Advantages
- A large suite of test programs is developed over time
- Allows issues to be detected early in the development lifecycle
- Developers forced to think in advance about what code is written

### Disadvantages
- Effort in creating unit tests has been the subject of debate
- Desire to provide test coverage for all code is unrealistic

### How to do it
1. Declare the test
2. Write the minimal amount of code to make the test pass
3. Refactor

#### Example
![](https://i.imgur.com/PucSmHx.png)

### Starting with (Failing) End to End Tests
This testing may significantly reduce the number of unit tests that need to be created

#### Example
![](https://i.imgur.com/Jy6rUge.png)

# By friday

DETERMINE PLANS WITH TESTING/IMPLEMENTAION - What is happening? Who's doing what?

# On Monday

No CCSE Lecture
Team Meetings (MON/TUE) --- ONLINE

IM will be impacted too.

# By monday

Have plans in place covering what we, as a team, are doing and what individuals are doing.
**These will be discussed with Tony.**
Can also cover what is easier/what is harder.
