# 10LE - TLS/SSL & TOR

###### tags: `ISS` `Week 10` `Lecture`

### TLS 1.2

This was the most good thing until Aug 2018

Useful link: [Every byte of a TLS connection explained and reproduced](https://tls.ulfheim.net)

#### Client Hello
:exclamation: This is all in clear text until change cipher spec
Client says 'hello i want to do crypt with you' and states what it is capable of doing (cipher, compression, etc.)

#### Server Hello
:exclamation: This is all in clear text until change cipher spec
- Sends random data (sent to prevent replay attacks)
- Selects cipher suite from available options given in client hello
- Selects compression method from options given in `client hello`

#### Server Certificate
Server provides a certificate, this is the ONLY way that the client can verify the identity of the server

#### Server Key Exchange Generation
The server calculates a private/public keypair for key exchange

Key exchange is a mathematic technique by which two parties can agree on the same number without an eavesdropper being able to tell what that number is

This is a secondary keypair

#### Server Key Exchange

The server provides information for key exchange. 

As part of the key exchange process both the server and the client will have a keypair of public and private keys, and will send the other party their public key. 

The shared encryption key will then be generated using a combination of each party's private key and the other party's public key.

#### Server hello done

The server indicates it has finished saying hello

#### Client Key Exchange Generation



#### Client Key Exchange

Sends the public part of the client key that it has generated

#### Client Encryption Keys Calculation

The client now has the information to calculate the encryption keys that will be used by each side. 

It uses the following information in this calculation: 

- server random (from Server Hello)
- client random (from Client Hello)
- server public key (from Server Key Exchange)
- client private key (from Client Key Generation) 

#### Client Change Cipher Spec

The client indicates that all further comms will be in cipher text and not plaintext

#### Client Handshake Finished

Hashes all the handshake messages to verify the integrity of the handshake process

#### Server Encryption Keys Calculation
Server does the same thing as the client using:

- server random (from Server Hello)
- client random (from Client Hello)
- client public key (from Server Key Exchange)
- server private key (from Client Key Generation)

#### Server Change Cipher Spec


#### Server handshake finished

Hashes all the handshake messages to verify the integrity of the handshake process

#### Client Application Data

#### Server Application Data

#### Client Close Notify

### TLS 1.3

https://tls13.ulfheim.net/

Big step up for citizen privacy.
Much more challenging to intercept

## TOR

Each TOR node are services that are available.

The client knows that nodes 1-7 are available.

### Example 1
The client wants to interact with a known, public avowed service, say `1.1.1.1`

The client decides it wants to use nodes 6 --> 1 --> 7
