pragma solidity >=0.5.0;

contract DweetSent {

    struct Dweet 
     {
        uint timestamp;
	string dweetString;
	address dweetAuthor;
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
    uint private totalDweetsCount;
    Dweet[] public RepoDweets;
    
    mapping (address => uint[]) public dweets_via_author;
    
    
    
}
