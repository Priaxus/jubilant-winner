# 5LE - threat modelling
###### tags: `CCSE` `Lecture` `Week 5`

## General Definintion
A term to define: 
- what you are trying to protect and the environment where it may be used
- intended operation of the thing that you are attempting to protect
- your adversaries' motives and objectives
- how to minimise/eliminate adversarial opportunity
- effectivenes of controls
- impacts of compromise of system or the wider environment

It is important because it:
- helps orgs avoid repeating mistajkes
- identify practiceis to implement

## Values & Principles
### Values - Threat Modelling Manifesto
- Develop a culture of finding and fixing design issues over checkbox compliance
- People & collaboration over processes, methodologies and tools
- A journey of understanding over a security or privacy snapshot
- Doing threat modelling > talking about it
- Coninuous refinement > single delivery

### Principles - threat modelloing aims to improve security and privacy by...
- involves early and frequent analysis
- needs to alighn with orgs engineering practices
- encourages dialogue accross the org where everyone understands each other
- creates measurable value for stakeholders

[threatmodellingmanifesto.org](https://threatmodellingmanifesto.org)

## Overview of the Approaches to Threat Modelling
### Software Centric
Makes use of software architecture diagrams (DFDs, Use Cases, Component Diagrams)

### Asset Centric
Threat assessment based on value of (information) assets (Attack Trees)

### Attacker Centric
requires profileing of attackers' skills and motivations (Attack Trees)

### Threat Centric
extends the software or asset centric approaches by including system capabilities, attack surfaces and from where the attack originates

## Examples
### Simple Software Centric Approach



A trust boundary is where you have a distinction on one side of the boundary to the other where there are different security contrtols on either side

## STRIDE
Spoofing
Tampering
Repudiation
Information disclosure
Denial of service
Elevation of privilege

`STRIDE-LM` = STRIDE + "LATERAL MOVEMENT"

## DREAD
**D**amage Potential (0 = Nothing, 5 = user Specific, 10 = complete system)
Reproducibility (0 system specific)
Exploitability
Affected users
Discoverability

## PASTA
**P**rocess for **A**ttack **S**imulation and **T**hreat **A**nalysis

## Attack Trees
![](https://i.imgur.com/ZTUEPBV.png)

## Useful link
[Link](https://github.com/jimmythompson/ent)

Could also add a threat model for our assessment: what would affect our ability to demo this presentation