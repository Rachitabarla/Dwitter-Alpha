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
    address[] userindex;
    address public owner;
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
     event DweetCreated(
        uint timestamp,
        string dweetString);
        
    function createDweet(string memory _dweetString) public{
       DweetCount++;
       timestamp = now;
       MyDweets[DweetCount] = Dweet(timestamp,_dweetString);
       emit DweetCreated(timestamp,_dweetString);
       }

}
