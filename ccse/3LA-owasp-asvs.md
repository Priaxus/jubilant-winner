# 3LA - OWASP ASVS
###### tags: `CCSE` `Week 3` `Lab`

:::info
- **Date:** Oct 22, 2021
- **Summary:**
    - Reading through OWASP Application Security Verification Standard (ASVS)
:::

## Step 1
- PLD stolen is bad
- Biometric data is vital signs (heart rate etc.)
- Protocols for a read only message, doesnt need to be `http`


### Life support
- PLD constantly sending bio data to central systems
- PLD pattern of life monitoring
- Need to check for erroneous results for biometrics

## Binning off
- V3
- V4
- V12
- V13

## Step 3
### Relevant V2 Requirements
#### 2.2.1 
**Verify that anti-automation controls are effective at mitigating breached credential testing, brute force, and account lockout attacks.** Such controls include blocking the most common breached passwords, soft lockouts, rate limiting, CAPTCHA, ever increasing delays between attempts, IP address restrictions, or risk-based restrictions such as location, first login on a device, recent attempts to unlock the account, or similar. Verify that no more than 100 failed attempts per hour is possible on a single account.

#### 2.2.6
Verify replay resistance through the mandated use of One-time Passwords (OTP) devices, cryptographic authenticators, or lookup codes

#### 2.2.7
Verify intent to authenticate by requiring the entry of an OTP token or user-initiated action such as a button press on a FIDO hardware key

#### 2.9.2
Verify that the challenge nonce is at least 64 bits in length, and statistically unique or unique over the lifetime of the cryptographic device

#### 2.9.3
Verify that approved cryptographic algorithms are used in the generation, seeding, and verification

### Relevent V14 Requirements
#### 14.1.4
Verify that the application build and deployment processes are performed in a secure and repeatable way, such as CI / CD automation, automated configuration management, and automated deployment scripts

#### 14.1.2
Verify that compiler flags are configured to enable all available buffer overflow protections and warnings, including stack randomization, data execution prevention, and to break the build if an unsafe pointer, memory, format string, integer, or string operations are found

#### 14.1.4
Verify that the application, configuration, and all dependencies can be re-deployed using automated deployment scripts, built from a documented and tested runbook in a reasonable time, or restored from backups in a timely fashion

#### 14.1.5
Verify that authorized administrators can verify the integrity of all security-relevant configurations to detect tampering

#### 