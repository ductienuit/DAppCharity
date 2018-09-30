pragma solidity ^0.4.24;

// import "./Events.sol";

contract Charity {
    
    struct Events {
        uint256 _idEvent;
        string _nameEvent;
        string _startDate;
        // string _endDate;
        uint256 _goal;
        string _location;
        string _receiver;
        string _description;
        string _imageHash;
        // address admin;
    }

    struct Giveth{
        uint256 idGiveth;
        string name;
        string location;
        uint256 idEvent;
        uint256 totalMoneygive;
        bool incognito;
        string Description;
    } 
    
    struct Receiver{
        uint256 idReceiver;
        string name;
        uint256 totalMoneyReceived;
        string Description;
    }

    address public admin;
    
    Giveth[] public arrayGiveth;
    Receiver[] public arrayReceiver;
    
    // Events[] public events;

    mapping (uint256 => Events) public events;
    uint256 public eventCount = 0;
    
    constructor() public {
        admin = msg.sender;
        Events memory e1 = Events(
            1, "Clean water for the urban area", "01/10/2018",
            10000, "Libya", "Hai Nguyen", "Water will be one of the key resources for sustainable urban development.", 
            "bg_2.jpg");

        Events memory e2 = Events(
            2, "We're the charity for children affected by war", "03/04/2019",
            7000, "Syria", "Hai Nguyen", "There are no words to name what we have been through",
            "cause-2.jpg");
        
        Events memory e3 = Events(
            3, "Effects of war on children", "01/10/2018",
            20000, "Syria", "Hai Nguyen", "During conflict, children and young people’s rights are violated on a massive scale; their rights to be ...",
            "cause-3.jpg");

        events[e1._idEvent] = e1;
        events[e2._idEvent] = e2;
        events[e3._idEvent] = e3;
        // events.push(e1);
        // events.push(e2);
        // events.push(e3);
        eventCount = 3;
    }
    
    modifier ifAdmin{
        require(msg.sender==admin);
        _;
    }
    
    function addEvents(
        uint256 idevent,string name,string dateopen, uint256 goal,
        string location, string receiver, string description, string imgHash) public ifAdmin {
        Events memory ev = Events(idevent, name, dateopen, goal, location,  receiver, description, imgHash);
        events[idevent] = ev;
        eventCount++;
    }

    // function getEventById(uint256 idEvent) public view returns (Events) {
    //     return events[idEvent];
    // }

    // function getNameEvent(uint256 idevent)public view returns(string){
    //     for(uint256 i = 0; i < events.length; i++) {
    //         if(idevent==events[i].getEventId()){
    //             return events[i].getNameEvent();
    //         }
    //     }
    // }
    
    // function getDateOpent(uint256 idevent)public view returns(string){
    //     for(uint256 i = 0; i < events.length; i++) {
    //         if(idevent==events[i].getidEvent()){
    //             return events[i].getdateOpent();
    //         }
    //     }
    // }
    
    // function getDateClose(uint256 idevent)public view returns(string){
    //     for(uint256 i = 0;i < events.length; i++){
    //         if(idevent==events[i].getidEvent()){
    //             return events[i].getdateClose();
    //         }
    //     }
    // }
    
    // function getTotalMoney(uint256 idevent) public view returns(uint256){
    //     for(uint256 i = 0; i < events.length; i++){
    //         if(idevent==events[i].getidEvent()){
    //             return events[i].gettotalmoney();
    //         }
    //     }
    // }
    
    // function getReceiver(uint256 idevent) public view returns(string){
    //     for(uint256 i = 0; i < events.length; i++) {
    //         if(idevent==events[i].getidEvent()){
    //             return events[i].getReceiver();
    //         }
    //     }
    // }
    
    // function addGiveth(uint256 id, string name, string location,uint256 idevent, uint256 money, bool incognito, string desc) public {
    //     Giveth memory newGiveth = Giveth({
    //         idGiveth:id, 
    //         name:name, 
    //         location:location, 
    //         idEvent:idevent, 
    //         totalMoneygive:money, 
    //         incognito:incognito, 
    //         Description:desc
    //     });
    //     arrayGiveth.push(newGiveth);
    // }
    
    // function addReceiver(uint256 id,string name, uint256 money, string desc)public ifAdmin {
    //     Receiver memory newreceiver = Receiver({
    //         idReceiver:id,
    //         name:name,
    //         totalMoneyReceived:money,
    //         Description:desc
    //     });
    //     arrayReceiver.push(newreceiver);
    // }
    // //get giveth
    // function getNameGiveth(uint256 id) public view returns(string){
    //     for(uint256 i = 0; i < arrayGiveth.length; i++){
    //         if(id==arrayGiveth[i].idGiveth){
    //             return arrayGiveth[i].name;
    //         }
    //     }
    // }
    
    // function getLocationGiveth(uint256 id) public view returns(string){
    //     for(uint256 i = 0; i < arrayGiveth.length; i++){
    //         if(id==arrayGiveth[i].idGiveth){
    //             return arrayGiveth[i].location;
    //         }
    //     }
    // }
    
    // function getIdEvent(uint256 id)public view returns(uint256){
    //     for(uint256 i = 0; i < arrayGiveth.length; i++){
    //         if(id==arrayGiveth[i].idGiveth){
    //             return arrayGiveth[i].idEvent;
    //         }
    //     }
    // }
    
    // function getTotalMoneyGiveth(uint256 id)public view returns(uint256){
    //     for(uint256 i = 0; i < arrayGiveth.length; i++){
    //         if(id==arrayGiveth[i].idGiveth){
    //             return arrayGiveth[i].totalMoneygive;
    //         }
    //     }
    // }
    
    // function getIncognito(uint256 id)public view returns(bool){
    //     for(uint256 i = 0; i < arrayGiveth.length; i++){
    //         if(id==arrayGiveth[i].idGiveth){
    //             return arrayGiveth[i].incognito;
    //         }
    //     }
    // }
    
    // function getDescriptionGiveth(uint256 id)public view returns(string){
    //     for(uint256 i = 0; i < arrayGiveth.length; i++){
    //         if(id==arrayGiveth[i].idGiveth){
    //             return arrayGiveth[i].Description;
    //         }
    //     }
    // } 
    // //get receiver
    // function getnameReceiver(uint256 id)public view returns(string){
    //     for(uint256 i = 0; i < arrayReceiver.length; i++){
    //         if(id==arrayReceiver[i].idReceiver){
    //             return arrayReceiver[i].name;
    //         }
    //     }
    // }
    
    // function gettotalMoneyReceived(uint256 id)public view returns(uint256){
    //     for(uint256 i = 0; i < arrayReceiver.length; i++){
    //         if(id==arrayReceiver[i].idReceiver){
    //             return arrayReceiver[i].totalMoneyReceived;
    //         }
    //     }
    // }

    // function getDescriptionReceived(uint256 id)public view returns(string){
    //     for(uint256 i = 0; i < arrayReceiver.length; i++) {
    //         if(id==arrayReceiver[i].idReceiver){
    //             return arrayReceiver[i].Description;
    //         }
    //     }
    // }
}
