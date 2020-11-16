pragma solidity >=0.5.0;

contract DweetSent {

    struct User {
        uint age;
        string EthAddress;
        uint index;
        uint DweetCount;
        mapping (uint => Dweet) MyDweets;
        Dweet[] DweetsArray;
    }
    mapping (address => User) public _user;
 
