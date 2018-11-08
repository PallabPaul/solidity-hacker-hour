pragma solidity ^0.4.25;

contract pru_client {
    
  address private cis_ID = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
  address private co_ID = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
  address private client_ID;
    
  string first_name_orig;
  string last_name_orig;
  string suffix_orig;
  uint social_security_orig;
  uint zip_code_orig;
  string gender_orig;
  uint house_number_orig;
  uint dob_orig;
  string street_name_orig;
  
  string co_string = 'Customer Office Information';
  uint co_int = 9128372;
  
  string public messages;

  // suppose the deployed contract has a purpose

  constructor (string first_name, string last_name, string suffix, uint social_security, uint zip_code, string gender, uint house_number, uint dob, string street_name)
    public {

   client_ID = msg.sender;

   first_name_orig = first_name;
   last_name_orig = last_name;
   suffix_orig = suffix;
   social_security_orig = social_security;
   zip_code_orig = zip_code;
   gender_orig = gender;
   house_number_orig = house_number;
   dob_orig = dob;
   street_name_orig = street_name;
   
  } 
  
  
    modifier onlyGroups {
        if((cis_ID == msg.sender) || (co_ID == msg.sender) || (client_ID == msg.sender)) {
            _;
        } else {
            revert();
        }
    }
    
    modifier onlyClientandCO {
        if((client_ID == msg.sender) || (co_ID == msg.sender)) {
            _;
        } else {
            revert();
        }
    }
      
    function viewRecord() public onlyGroups constant returns(string, string, string, uint, uint, string, uint, uint, string) {
     
            return (first_name_orig, last_name_orig, suffix_orig, social_security_orig, zip_code_orig, gender_orig, house_number_orig, dob_orig, street_name_orig);
    
    }
    
    function viewCORecord() public onlyClientandCO constant returns(string, uint) {
        
            return (co_string, co_int);
    }
     
    function updateFName(string newFName) public onlyGroups returns(string) {
        
        first_name_orig = newFName;
        messages = 'Client has updated first name';
    }
    function updateLName(string newLName) public onlyGroups returns(string) {
        
        last_name_orig = newLName;
        messages = 'Client has updated last name';
    }
    function updateSuffix(string newSuffix) public onlyGroups returns(string) {
        
        suffix_orig = newSuffix;
        messages = 'Client has updated suffix';
    }
    function updateSS(uint newSS) public onlyGroups returns(uint) {
        
        social_security_orig = newSS;
        messages = 'Client has updated social security';
    }
    function updateZipCode(uint newZipCode) public onlyGroups returns(uint) {
        
        zip_code_orig = newZipCode;
        messages = 'Client has updated zip code';
    }
    function updateGender(string newGender) public onlyGroups returns(string) {
        
        gender_orig = newGender;
        messages = 'Client has updated gender';
    }
    
    function updateHouseNum(uint newHouseNum) public onlyGroups returns(uint) {
        
        house_number_orig = newHouseNum;
        messages = 'Client has updated house number';
    }
    function updateDOB(uint newDOB) public onlyGroups returns(uint) {
        
        dob_orig = newDOB;
        messages = 'Client has updated date of birth';
    }
    
    function updateStreet(string newStreet) public onlyGroups returns(string) {
        
        street_name_orig = newStreet;
        messages = 'Client has updated street name';
    }    
    
}

