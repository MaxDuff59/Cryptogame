// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract Characters is ERC721 {
    
    struct personnage{
    string name;
    uint256 strength;
    string sexe;
    string image;
    }
    
    personnage[]personnages;
    uint index;
    constructor () ERC721("Characters", "ch"){}
    
    
    function creation_personnage(string memory name,uint strength,string memory sex,string memory image) public payable {
        require(msg.value >= 1 ether, "Not enough ether : check price.");
        personnages.push(personnage(name,strength,sex,image));
        _mint(msg.sender,index);
        index += 1;
    }
    
    function random() private view returns (uint) {
        return block.timestamp%10;
    }
    
    function fight(uint id1, uint id2) public returns (uint){
        uint diff1;
        uint diff2;
        diff1 = personnages[id1].strength - personnages[id2].strength;
        diff2 = personnages[id2].strength - personnages[id1].strength;
        uint vainqueur;
        if (diff1 > diff2) {
            if (random() < 9) {
        //perso 1 est plus fort
                personnages[id1].strength += 1;
                vainqueur = id1;
        }
            else{
                personnages[id2].strength += 1;
                vainqueur = id2;
        }
        
        }
        if (diff2 > diff1) {
            if (random() < 1) {
            //perso 1 est plus fort
                personnages[id1].strength += 1;
                vainqueur = id1;
        }
            else{
                personnages[id2].strength += 1;
                vainqueur = id2;
        }
        
        }
        if (diff2 == diff1){
            if (random() < 5) {
                personnages[id2].strength += 1;
                vainqueur = id2;
        }
            else{
                personnages[id1].strength += 1;
                vainqueur = id1;
        }
        }
        
        return vainqueur;
    }
    
    function breed(uint id1, uint id2) public {
        uint strength;
        string memory sex;
        string memory image;
        string memory name;
        strength = ((personnages[id1].strength+personnages[id2].strength)/2)+1;// a mettre en entier
        name = 'frandk';
        if (random() < 5){
            sex = "male";
        }
        else{
            sex = "female";
        }
        image = 'test';
        personnages.push(personnage(name,strength,sex,image));
        _mint(msg.sender,index);
        index += 1;
    }
    }
    
