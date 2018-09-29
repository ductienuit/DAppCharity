pragma solidity ^0.4.24;

import "./Events.sol";

contract Charity {
    
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
    
    Events[] public arrayEvents;
    
    constructor() public {
        admin = msg.sender; 
    }
    
    modifier ifAdmin{
        require(msg.sender==admin);
        _;
    }
    
    function addEvents(uint256 idevent,string name,string dateopen,string dateclose, uint256 totalmoneymin,
        string location, string receiver, string description) public ifAdmin {
        Events ev = new Events();
        ev.createEvents(idevent, name, dateopen, dateclose,  totalmoneymin, location,  receiver, description);
        arrayEvents.push(ev);
    }
    
    function getNameEvent(uint256 idevent)public view returns(string){
        for(uint256 i = 0; i < arrayEvents.length; i++) {
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getNameEvent();
            }
        }
    }
    
    function getDateOpent(uint256 idevent)public view returns(string){
        for(uint256 i = 0; i < arrayEvents.length; i++) {
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getdateOpent();
            }
        }
    }
    
    function getDateClose(uint256 idevent)public view returns(string){
        for(uint256 i = 0;i < arrayEvents.length; i++){
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getdateClose();
            }
        }
    }
    
    function getTotalMoney(uint256 idevent) public view returns(uint256){
        for(uint256 i = 0; i < arrayEvents.length; i++){
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].gettotalmoney();
            }
        }
    }
    
    function getreceiver(uint256 idevent) public view returns(string){
        for(uint256 i = 0; i < arrayEvents.length; i++) {
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getReceiver();
            }
        }
    }
    
    function addGiveth(uint256 id, string name, string location,uint256 idevent, uint256 money, bool incognito, string desc) public {
        Giveth memory newGiveth = Giveth({
            idGiveth:id, 
            name:name, 
            location:location, 
            idEvent:idevent, 
            totalMoneygive:money, 
            incognito:incognito, 
            Description:desc
        });
        arrayGiveth.push(newGiveth);
    }
    
    function addReceiver(uint256 id,string name, uint256 money, string desc)public ifAdmin {
        Receiver memory newreceiver = Receiver({
            idReceiver:id, 
            name:name, 
            totalMoneyReceived:money, 
            Description:desc
        });
        arrayReceiver.push(newreceiver);
    }
    //get giveth
    function getNameGiveth(uint256 id) public view returns(string){
        for(uint256 i = 0; i < arrayGiveth.length; i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].name;
            }
        }
    }
    
    function getLocationGiveth(uint256 id) public view returns(string){
        for(uint256 i = 0; i < arrayGiveth.length; i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].location;
            }
        }
    }
    
    function getIdEvent(uint256 id)public view returns(uint256){
        for(uint256 i = 0; i < arrayGiveth.length; i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].idEvent;
            }
        }
    }
    
    function getTotalMoneyGiveth(uint256 id)public view returns(uint256){
        for(uint256 i = 0; i < arrayGiveth.length; i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].totalMoneygive;
            }
        }
    }
    
    function getIncognito(uint256 id)public view returns(bool){
        for(uint256 i = 0; i < arrayGiveth.length; i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].incognito;
            }
        }
    }
    
    function getDescriptionGiveth(uint256 id)public view returns(string){
        for(uint256 i = 0; i < arrayGiveth.length; i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].Description;
            }
        }
    } 
    //get receiver
    function getnameReceiver(uint256 id)public view returns(string){
        for(uint256 i = 0; i < arrayReceiver.length; i++){
            if(id==arrayReceiver[i].idReceiver){
                return arrayReceiver[i].name;
            }
        }
    }
    
    function gettotalMoneyReceived(uint256 id)public view returns(uint256){
        for(uint256 i = 0; i < arrayReceiver.length; i++){
            if(id==arrayReceiver[i].idReceiver){
                return arrayReceiver[i].totalMoneyReceived;
            }
        }
    }

    function getDescriptionReceived(uint256 id)public view returns(string){
        for(uint256 i = 0; i < arrayReceiver.length; i++) {
            if(id==arrayReceiver[i].idReceiver){
                return arrayReceiver[i].Description;
            }
        }
    }
}
