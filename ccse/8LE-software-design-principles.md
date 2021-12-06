# 8LE - Software Design Principles

###### tags: `CCSE` `Week 8` `Lecture`

## SOLID Principles

We need tried and tested design principles to ensure we can create and manage extensible software as economically as possible

SOLID principles inform us how we arrange methods and data structures into couplings of functions and data ("Classes" in OOP)

### Single Responsibility Principle
Each module is responsible to one and only actor

This doesn't mean that modules should "do just one thing", but that the module shuld be responsible to one and only one actor.

E.g.: A module tracking the timeline for the given test in your assessment:
- `Calculate_duration()` - What does this method report?


![](https://i.imgur.com/ClHwk8T.png)

Can fall apart easily if the wrong things are edited.

Doesn't necessarily result into duplicate code if you split out the code into separate methods

### Dependency Inversion Principle
High level code should NOT depend on low level implementations

The most flexible systems (easiest to create and manage) are where source code dependencies refer to abstractions and not concrete implementations

Coding to interfaces not concrete classes

#### Example 1
![](https://i.imgur.com/LyCBvIR.png)
<br>
#### Example 2A
![](https://i.imgur.com/XzF09z5.png)
The issue is that the `Collect user activity logs` section is wholly dependent on everything below it
<br>
#### Example 2B (2A Improved)
![](https://i.imgur.com/m486PVJ.png)
---

Make sure you start work on defining your data structures that are to be passed between the different modules

Creating "contracts" between modules early in the process is better for supporting independent dev

## Group Work

:::info
### Objectives
- Split into group channels
- Work out modules to create
- Think about the info that'll be passed between the modules
- How are we declaring a test to be executed by the program
:::

### Luke's Ramblings

Highest level - Moniting interface
 - current state of the system
 - **interact**
 - person move around

differnt things

 - gates
 - control utils
 - lots of stuff
 - state, ingress, egress

```python
class SomePartOfTheSimmulation():
    pass

class Pod(SomePartOfTheSimmulation):
    large = False
    nested = False
    north = pod_1
    south = pod_2

class AirLock(SomePartOfTheSimmulation):
    pass

class ACMS(SomePartOfTheSimmulation):
    pass
```

`user interface <---> interfaces`

because of this seperation, simulations can run headless (without an interface) and store results in a file.

```
A: B
B: A, D, F
C: B, E
D: B, E
E: C, D, F
F: F

ABC
 DE
  F
```
```python
connections = (
    (A, B, hor),
    (B, D, ver),
    (B, C, ),
    (C, E),
    (E, F),
)
```

```yaml
pods:
    - size: small
      id: 1
      lkdsfl: sdflkj
    - size: large
      id: 2
      jsdlf: dslkkjfds
connections:
    - 1, 2
    - 2, 3
    - 1, 3
test_params:
    - test_type: hazard
      time_arrival: 2s
      location: 2
    - test_type: hazard
      time_arrival: 4s
      location: 1
```


:::warning
## Questions for Tony
- Can manual lockdowns happen and do we need to model them?
:::