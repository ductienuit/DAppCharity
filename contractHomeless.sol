pragma solidity ^0.4.23;

contract managerHomeless{

    address public _ower;
    mapping (address => uint256) _homeLess;
    address[] public idHomeless;
    
    constructor() public{
  		_ower=msg.sender;
  	}
  	
  	 modifier ifbuy{
        require(msg.sender==_ower);
        _;
    }
    
    function addHomeless(address _address) public {
        _homeLess[_address] = 100;
        
        idHomeless.push(_address) -1;
    } 
    
    function excepttotalMoney(address _address,uint256 money)ifbuy public {
        if(money<_homeLess[_address]){
            _homeLess[_address] -= money;
        }
    }
    
    // function Execution(address _ower,uint256 coin) public returns(uint256){
    //     _ower.send(coin);
    // } 
    
    function getTotalMoney(address _address)view public returns(uint256){
        return (_homeLess[_address]);
    }
    
}