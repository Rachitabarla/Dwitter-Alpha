pragma solidity >=0.5.0;

contract DweetSent {
     struct Dweet 
     {
        uint timestamp;
		string dweetString;
     }
    struct User {
        uint age;
        string EthAddress;
        uint index;
        uint DweetCount;
        mapping (uint => Dweet) MyDweets;
        Dweet[] DweetsArray;
    }
    mapping (address => User) public _user;
    
    address[] user _index;
    address public owner;
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    //OAuth Sign In via MetaMask to be figured out.(event specifier and SSO plugin if needed?)
    
