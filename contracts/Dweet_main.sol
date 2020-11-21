pragma solidity >=0.5.1;

contract DweetSent {
    uint public DweetCount;
    uint256 id;
    uint public lCount = 0;
    uint public rCount = 0 ;
     struct Dweet 
     {
        uint256 id;
	    string dweetString;
	    uint lCount;
     }
    struct User {
        uint age;
        string EthAddress;
        string email;
        uint index;
        Dweet[] DweetsArray;
    }
    mapping (uint => Dweet) public MyDweets;
    mapping (address => User) user;
    mapping(uint => uint) reportCount;
    mapping(address => bool) reportAddress;
    mapping (address => uint) like;
    
    address [] userindex;
    address payable owner = msg.sender;
    bool action = false;
    
    constructor() public {
        createDweet("Hello World");
    }
        modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    event DweetCreated(
        uint id,
        string dweetString);
        
    function createDweet(string memory _dweetString) public onlyOwner{
       DweetCount++;
       id +=1;
       MyDweets[DweetCount] = Dweet(id,_dweetString,0);
       emit DweetCreated(id,_dweetString);
       }
       
       event Reported(
           uint id,
           string dweetString);
           
     function reportOnce(uint _id, address _ethaddress) external {
        
         if (reportAddress[_ethaddress]!= true && reportCount[_id]< 1){
            reportDweet(_id,_ethaddress);
         }
     }
     
     function reportDweet(uint _id,address _ethaddress) internal {
         rCount+=1;
         reportCount[id] = rCount;
         
         if ((reportCount[id])>=10) {
            MyDweets[_id].dweetString = "";
            rCount = 0;
            reportAddress[_ethaddress] = true;
         }
         emit Reported(id, MyDweets[_id].dweetString);
     }
     
    event profileUpdate (
        uint age,
        string email); 
    
    function editprofile(address _address, uint _age, string memory _email) public onlyOwner{
        
        require(_address == msg.sender);
        user[_address].age = _age;
        user[_address].email = _email;
        emit profileUpdate(user[_address].age ,user[_address].email);
    }
    
    event liked(
        uint id,
        uint likeCount
        );
     function likeOnce(uint _id, address _ethaddress) external {
        
         if (like[_ethaddress] < 1 ){
            likeDweet(_id,_ethaddress);
         }
     }
         
         function likeDweet(uint _id , address _ethaddress) internal {
             like[_ethaddress] += 1;
             lCount+=1;
             //like[lCount] += 1;
             MyDweets[_id].lCount += 1;
             emit liked(_id,MyDweets[_id].lCount);
         }
     }
     
   
