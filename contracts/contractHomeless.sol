pragma solidity ^0.4.23;

contract managerHomeless{

    address public _ower;
    mapping (uint => uint256) _homeLess;
    uint[] public idHomeless;
    
    constructor() public{
  		_ower=msg.sender;
  	}
  	
  	 modifier ifbuy{
        require(msg.sender==_ower);
        _;
    }
    
    function addHomeless(uint _address) public {
        _homeLess[_address] = 100;
        
        idHomeless.push(_address) -1;
    } 
    
    function excepttotalMoney(uint _address,uint256 money)ifbuy public returns(string){
        if(money<=_homeLess[_address]){
            _homeLess[_address] -= money;
            return "complete";
        }else{
            return  "Not enough money to make a transaction";
        }
    }
    
    // function Execution(address _ower,uint256 coin) public returns(uint256){
    //     _ower.send(coin);
    // } 
    
    function getTotalMoney(uint _address)view public returns(uint256){
        return (_homeLess[_address]);
    }
    
}