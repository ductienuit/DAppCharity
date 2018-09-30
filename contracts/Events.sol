pragma solidity 0.4.24; 

contract Events{
    
    uint256 public _idEvent;
    string _nameEvent;
    string _startDate;
    string _endDate;
    uint256 _goal;
    string _location;
    string _receiver;
    string _description;
    string _imageHash;
    address public admin;
    
    constructor() public {
        admin = msg.sender;
    }
    
    modifier ifAdmin{
        require(msg.sender==admin);
        _;
    }
    
   // Events[] public arrayEvents;
    
    function createEvents(
        uint256 idevent,string name,string startDate,
        uint256 goal, string location, string receiver, string description,
        string imgHash) public ifAdmin {
        _idEvent = idevent;
        _nameEvent = name;
        _startDate = startDate;
        // _endDate = endDate;
        _goal = goal;
        _location = location;
        _receiver = receiver;
        _description = description;
        _imageHash = imgHash;
    }
    
    
    function getEventId() public view returns(uint256){
        return _idEvent;
    }
    
    function getNameEvent() public view returns(string){
        return _nameEvent;
    }
    
    function getStartDate() public view returns(string){
        return _startDate;
    }
    
    // function getEndDate() public view returns(string){
    //     return _endDate;
    // }
    
    function getEventGoal() public view returns(uint256){
        return _goal;
    }
    
    function getLocation() public view returns(string){
        return _location;
    }
    
    function getReceiver() public view returns(string){
        return _receiver;
    }
    
    function getDescription() public view returns(string) {
        return _description;
    }
    
    function getImg() public view returns (string) {
        return _imageHash;
    }
}
