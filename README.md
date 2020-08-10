# Bank Tech Test

As part of Week10 of Makers Course, we have been challenged with creating a Bank which works in ruby. The aim is to practice our OO design and TDD skills.

We are working alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

The Trello Board can be found here:
https://trello.com/c/po3loDD4/5-link-to-requirement

Diagram can be found here:
https://drive.google.com/file/d/1s23sRsFZ9sNXO4XqoVIz5WeLyjlkiwhS/view?usp=sharing

User Stories can be found here:
https://docs.google.com/document/d/1R48fuoj0gbGOVL8Bn1dq-9qFzUY3SBDPvUp43D-pg4E/edit?usp=sharing

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit