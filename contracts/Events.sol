pragma solidity 0.4.24; 

contract Events{
    
    uint256 idEvent;
    string nameEvent;
    string dateOpen;
    string dateClose;
    uint256 totalMoneyMin;
    string Location;
    string Receiver;
    string Description;
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
        uint256 idevent,string name,string dateopen,string dateclose,
        uint256 totalmoneymin, string location, string receiver, string description) public ifAdmin payable {
        idEvent = idevent;
        nameEvent = name;
        dateOpen = dateopen;
        dateClose = dateclose;
        totalMoneyMin = totalmoneymin;
        Location = location;
        Receiver = receiver;
        Description = description;
    }
    
    
    function getidEvent() public view returns(uint256){
        return idEvent;
    }
    
    function getNameEvent() public view returns(string){
        return nameEvent;
    }
    
    function getdateOpent() public view returns(string){
        return dateClose;
    }
    
    function getdateClose() public view returns(string){
        return dateClose;
    }
    
    function gettotalmoney() public view returns(uint256){
        return totalMoneyMin;
    }
    
    function getlocation() public view returns(string){
        return Location;
    }
    
    function getReceiver() public view returns(string){
        return Receiver;
    }
    
    function getDescription() public view returns(string) {
        return Description;
    }
    
}
