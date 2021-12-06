# 7LE - Implementing a security policy
###### tags: `ISM` `Week 7` `Lecture`

## How to organise policies
- Identify areas of policy overlap
- Examine areas that might be overlooked
- Align the entire IT environment with business objectives
- Security policies for each domain support layered defences and improve the security posture of the organisation

## guidelines for evvective
1. Developed using indeustry accepted practices and aproved formally by mgmt
2. Distributed appropiatelt
3. Read and understood by emploiyedee
4. Formally agreed to by act of affirmation
5. uniformly applied and enforced

## the policy
It should contain:
![](https://i.imgur.com/etBlOht.png)

Policies should be short, and easily understood by the user.
It doesn't need to be explained in depth. The statements need to be effective and understandable.

Useful link: https://warwick.ac.uk/services/sim/policies/

## Considerations
- Level of authentication
    - How will creds be validated
    - Method must suit the business context
- Authorisation and access control
    - Determine who has access to what
        - "Who" can be a user?
            - A device?
            - a serive?
        - Role-based access control?
        - Attribute based access control?
- Types of LANs
    - Flat
    - Segmented
- DMZ
- VPN
- Data loss protection
- Layers of defence
    - Inventory
        - IDing data at rest
    - Perimeter
        - Monitoring of data in motion
    - Encryption
        - Encryption of data ourside the network
            - E.g. Mobile devices

## Levels of policies
There are 3 levels of policy as shown here:
![](https://i.imgur.com/a4D7L0V.png)

## To build how to policy a
### Members of policy team
- Senior admin
- Legal
- Representative from rank-and-file employees
- Member of IT
- Editor or owner who can present and structure the poilicy coherently


- ID one person to be the officla policy interepreter

### Overall approach
- Two primary activities for overall approach
    - Restrictive (If not covered by policy, it is not permitted)
    - Permissive (If not covered by policy, it is permitted)
- Specific security stances:
    - Open
    - Optimistic
    - Cautious
    - Strict
    - Paranoid

### Identify assts to be protected
- Physical assets
    - Actual hardware
- Logical assets
    - Digital information that can be viewed and misused
- Network assets
    - Routers
    - Cables
    - Bastion Hosts
    - Servers
    - Firewalls
    - Software
- System assets
    - Software that runs the system
        - Server software and apps


### What should be audited
should specify types of comms to be recorded and for how long. 
- audit sys resources
- audit security events

### ID security risks
Specify kinds of attacks that the system needs to be guarded against
- DOS
- Disclosure of info due to fraud
- Unauthorised access

### Define acceptable use
Define acceptable computing and comms practices on the part of employees and business partners


### Provide for remote access
- Specigy acceptable protocols
- Determine use of telnet or ssh to access internal net from internet
- Decribe use of cable modem, vpn and dsl connections to access internal network through the firewall
- Require remote users to have a firewall
- Require remote device mgmt
- Require MFA

### Other considerations
- /secure use of office-owned laptops
- wureless security
- use of VPNs
- key policyt
- password
- encryptions
- restrictions on removable media
- ASPs
- Accueptable users

### Defining response to violations
- Gather info on an incident response form
- Define diciplinary action to be pursued if employees access the intra or inter net improperly
- ID who to contact in case of an intrusion

## Key tasks
1. ID what to protect
2. ID what youre trying to protect it from
3. Determine threat likelihood
4. Implement measures to protect assets in cost-effective manner
5. Review process continually and make improvements