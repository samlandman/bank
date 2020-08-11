# Bank Tech Test

As part of Week10 of Makers Course, I have been challenged with creating a Bank which works in Ruby. The aim is to practice our OO design and TDD skills using a methodical approach.

We are working alone, and have had the opportunity to review our own code so to practice reflecting on and improving our own work. 

The Trello Board can be found [here:](https://trello.com/c/po3loDD4/5-link-to-requirement)

Diagram can be found [here:](https://drive.google.com/file/d/1s23sRsFZ9sNXO4XqoVIz5WeLyjlkiwhS/view?usp=sharing)

User Stories can be found [here](https://docs.google.com/document/d/1R48fuoj0gbGOVL8Bn1dq-9qFzUY3SBDPvUp43D-pg4E/edit?usp=sharing)

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

## To Run The Program

Run the following commands in the terminal:

```
git clone ...
cd banktechtest
irb -r './lib/bank.rb'
```

## To run the tests

The program is tested using Rspec. 

Run the following commands: 

```
bundle install
rspec
```

## Test Coverage

```
100%
```

## Approach

I came at the process from a top down approach. The first aim was to complete the specifications in one class. I broke the acceptance criteria down into [user stories](https://docs.google.com/document/d/1R48fuoj0gbGOVL8Bn1dq-9qFzUY3SBDPvUp43D-pg4E/edit?usp=sharing) and then worked through the tasks methodically using a TDD approach (writing the test first, and then solving the test in its most simplest form). I found that at one point it was necessary to jump quite considerably on the statement method, as there was a lot of underlying functionality which was required. I took some time with Alice, the head coach at Makers to understand how to make the jump in smaller steps. The suggestion was to create the ultimate feature test, and run through each error in the spec methodically, adding further testing on the way when required.

Having achieved a working model, I then refactored to ensure SRP and DRY principles. The refactoring and tightening of the code took longer than the first specification.

The last part of the approach was to focus on edge cases, guarding against an overdrawn account for example, no date input and also against unrecognised inputs (eg. deposit("a")).

## Structure

For clarity, I decided to use a singe class approach. This can be seen as follows:

![image1](https://github.com/samlandman/banktechtest/images/img1.png)

Having achieved a working model, I then decided to remove the printing from the class to achieve SRP. 

![image2](https://github.com/samlandman/Makersbnb/blob/master/public/images/Screen%20Shot%202020-07-13%20at%2015.00.00%202.png)

A third class could have been used to store the information relating to each piece of activity, but I decided that a hash within the bank class was a suitable step given the relative simplicity of the stored information. At a later date, if required, it would be easy to retrospectively turn the hash into its own separate class and test it independently as a unit. 

## Follow up

I would like to have included:

- Calculation for accrued interest
- Edge case for reordering array based on date/time
- Being more specific with time of day to handle withdrawals on the same day in the correct order
- A tighter front end (at it's most basic, an interface on the command line)
- A database for storing information across sessions
- A sign in, for security




