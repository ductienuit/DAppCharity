pragma solidity ^0.4.23;


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
    
    constructor() public{
  		admin = msg.sender;
  	}
    
    modifier ifAdmin{
        require(msg.sender==admin);
        _;
    }
    
   // Events[] public arrayEvents;
    
    function createEvents(uint256 idevent,string name,string dateopen,string dateclose,
                    uint256 totalmoneymin, string location, string receiver, string description) ifAdmin payable{
                        idEvent=idevent;
                        nameEvent=name;
                        dateOpen=dateopen;
                        dateClose=dateclose;
                        totalMoneyMin=totalmoneymin;
                        Location=location;
                        Receiver=receiver;
                        Description=description;
    }
    
    
    function getidEvent()constant returns(uint256){
        return idEvent;
    }
    
    function getNameEvent()constant returns(string){
        return nameEvent;
    }
    
    function getdateOpent()constant returns(string){
        return dateClose;
    }
    
    function getdateClose()constant returns(string){
        return dateClose;
    }
    
    function gettotalmoney()constant returns(uint256){
        return totalMoneyMin;
    }
    
    function getlocation()constant returns(string){
        return Location;
    }
    
    function getReceiver()constant returns(string){
        return Receiver;
    }
    
    function getDescription()constant returns(string){
        return Description;
    }
    
}

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
    Events ev=new Events();
    
        constructor() public{
  		admin = msg.sender;
  	}
    
    modifier ifAdmin{
        require(msg.sender==admin);
        _;
    }
    
    function createEvents(uint256 idevent,string name,string dateopen,string dateclose, uint256 totalmoneymin, 
                                string location, string receiver, string description)ifAdmin public {
        ev.createEvents( idevent, name, dateopen, dateclose,  totalmoneymin, location,  receiver, description);
        arrayEvents.push(ev);
    }
    
    function getnameEvent(uint256 idevent)constant returns(string){
        for(uint256 i=0;i<arrayEvents.length;i++){
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getNameEvent();
            }
        }        
    }
    
    function getdateopent(uint256 idevent)constant returns(string){
        for(uint256 i=0;i<arrayEvents.length;i++){
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getdateOpent();
            }
        }        
    }
    
    function getdateclose(uint256 idevent)constant returns(string){
        for(uint256 i=0;i<arrayEvents.length;i++){
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getdateClose();
            }
        }    
    }
    
    function gettotalMoney(uint256 idevent) constant returns(uint256){
        for(uint256 i=0;i<arrayEvents.length;i++){
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].gettotalmoney();
            }
        }    
    }
    
    function getreceiver(uint256 idevent) constant returns(string){
        for(uint256 i=0;i<arrayEvents.length;i++){
            if(idevent==arrayEvents[i].getidEvent()){
                return arrayEvents[i].getReceiver();
            }
        }
    }
    
    function addGiveth(uint256 id, string name, string location,uint256 idevent ,uint256 money, bool incognito, string desc)public{
        Giveth memory newGiveth=Giveth({
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
    
    function addReceiver(uint256 id,string name, uint256 money, string desc)ifAdmin public{
        Receiver memory newreceiver=Receiver({
            idReceiver:id,
            name:name,
            totalMoneyReceived:money,
            Description:desc
        });
        arrayReceiver.push(newreceiver);
    }
    //get giveth
    function getNameGiveth(uint256 id) constant returns(string){
        for(uint256 i=0;i<arrayGiveth.length;i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].name;
            }
        }
    }
    
    function getLocationGiveth(uint256 id) constant returns(string){
         for(uint256 i=0;i<arrayGiveth.length;i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].location;
            }
        }
    }
    
    function getIdEvent(uint256 id)constant returns(uint256){
         for(uint256 i=0;i<arrayGiveth.length;i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].idEvent;
            }
        }
    }
    
    function getTotalMoneyGiveth(uint256 id)constant returns(uint256){
         for(uint256 i=0;i<arrayGiveth.length;i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].totalMoneygive;
            }
        }
    }
    
    function getincognito(uint256 id)constant returns(bool){
         for(uint256 i=0;i<arrayGiveth.length;i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].incognito;
            }
        }
    }
    
   function getDescriptionGiveth(uint256 id)constant returns(string){
         for(uint256 i=0;i<arrayGiveth.length;i++){
            if(id==arrayGiveth[i].idGiveth){
                return arrayGiveth[i].Description;
            }
        }
    } 
    //get receiver
    function getnameReceiver(uint256 id)constant returns(string){
        for(uint256 i=0;i<arrayReceiver.length;i++){
            if(id==arrayReceiver[i].idReceiver){
                return arrayReceiver[i].name;
            }
        }
    }
    
    function gettotalMoneyReceived(uint256 id)constant returns(uint256){
        for(uint256 i=0;i<arrayReceiver.length;i++){
            if(id==arrayReceiver[i].idReceiver){
                return arrayReceiver[i].totalMoneyReceived;
            }
        }
    }
    
    function getDescriptionReceived(uint256 id)constant returns(string){
        for(uint256 i=0;i<arrayReceiver.length;i++){
            if(id==arrayReceiver[i].idReceiver){
                return arrayReceiver[i].Description;
            }
        }
    }
    
}