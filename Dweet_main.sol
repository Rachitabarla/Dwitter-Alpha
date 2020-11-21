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
    
     function addUser (string memory _EthAddress, uint _age) public returns (bool success)  {
        address Address = msg.sender;
        require(isUser(Address) == false); 
        users[Address].age = _age;
        users[Address].EthAddress = _EthAddress;
        users[Address].index = user_index.push(Address) - 1;
        emit LogNewUser(Address, users[Address].index, _EthAddress, _age);
        return true;
    }
     
     function createDweet(string memory _text) public returns (bool) {
        require (isUser(msg.sender) == true);
        uint dweet_index;
        dweet_index = all_dweets.push(Dweet(_text, msg.sender))-1;

        uint _count = users[msg.sender].DweetCount;
        users[msg.sender].MyDweets[_count] = Dweet(_text, msg.sender);
        users[msg.sender].DweetCount ++;

        users[msg.sender].DweetsArray.push(Dweet(_text, msg.sender));

        return true;
    }
    
    
    
}
