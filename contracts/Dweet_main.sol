pragma solidity >=0.5.1;

contract DweetSent {
    uint public DweetCount;
    uint256 public timestamp;
     struct Dweet 
     {
        uint256 timestamp;
	    string dweetString;
     }
    struct User {
        uint age;
        string EthAddress;
        uint index;
        Dweet[] DweetsArray;
    }
    mapping (uint => Dweet) public MyDweets;
    mapping (address => User) public _user;
    
    address [] userindex;
    address public owner;
    
    
    constructor() public {
        createDweet("Hello World");
        owner = msg.sender;
        timestamp=1544668513;
    }
    
    
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    event DweetCreated(
        uint timestamp,
        string dweetString);
        
    function createDweet(string memory _dweetString) public onlyOwner{
       DweetCount++;
       timestamp = block.timestamp;
       MyDweets[DweetCount] = Dweet(timestamp,_dweetString);
       emit DweetCreated(timestamp,_dweetString);
       }
}