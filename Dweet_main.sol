pragma solidity >=0.5.0;

contract DweetSent {

    struct Dweet 
     {
        uint timestamp;
	string dweetString;
	address dweetAuthor;
	string dweet_tags;
	 
	
     }
    struct User {
        uint age;
        string EthAddress;
        uint index;
        uint DweetCount;
        mapping (uint => _dweets) MyDweets;
        Dweet[] DweetsArray;
    }
    mapping (address => _user) public _user;
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
    
    //Take Mohit's confirmations for monitoring page as well as tagging. Else, tagging could be low priority.
    event LogNewUser (address indexed Address, uint index, string EthAddress, uint age);
    event LogUpdateUser (address indexed Address, uint index, string EthAddress, uint age);
    event NewDweet (address indexed Address, uint )

    function isUser(address Address) public view returns (bool yesIsUser){
        if(userindex.length == 0) return false;
        return (userindex[users[Address].index] == Address); 
    
     function addUser (string memory _EthAddress, uint _age) public returns (bool success)  {
        address Address = msg.sender;
        require(isUser(Address) == false); 
        users[Address].age = _age;
        users[Address].EthAddress = _EthAddress;
        users[Address].index = userindex.push(Address) - 1;
        emit LogNewUser(Address, users[Address].index, _EthAddress, _age);
        return true;
    }
    
    function getUser(address Address) public view returns(string memory EthAddress, uint age, uint index) {
        require(isUser(Address) == true);
        return (users[Address].EthAddress, users[Address].age, users[Address].index);
    }

     
     function createDweet(string memory _text) public returns (bool) {
        require (isUser(msg.sender) == true);
        uint dweet_index;
        dweet_index = RepoDweets.push(Dweet(_text, msg.sender))-1;

        uint _count = users[msg.sender].DweetCount;
        users[msg.sender].MyDweets[_count] = Dweet(_text, msg.sender);
        users[msg.sender].DweetCount ++;

        users[msg.sender].DweetsArray.push(Dweet(_text, msg.sender));

        return true;
    }
    
    function dweetsByUser(address Address) public view returns (Dweet[] memory) {
        require (isUser(Address) == true);

        Dweet[] memory _dweets = new Dweet[](users[Address].dweet_count);
        
        return users[Address].DweetsArray;
    }
    
    function totalDweetsByUser (address Address) public view returns (uint) {
        return users[Address].dweet_count;
    }

    function dweetByIndex(uint _id) public view returns (string memory _dweet, address _author) {
        _dweet = RepoDweets[_id].dweet_text;
        _author = RepoDweets[_id].dweet_author;
        return  (_dweet, _author);
    }
    
    
    
}
