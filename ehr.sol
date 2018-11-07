pragma solidity ^0.4.25;

contract Record {
    address public patientID;
    address public requestorID;
    address public doctorID;
    
    constructor () public {
        patientID = msg.sender;
    }
    
    string public messages;
    
    string name = 'John Doe';
    uint age = 17;
    uint weight = 170;
    uint height = 60;
    string allergies = 'Nuts, Pollen';
    string medicine = 'Singular, Allegra';
    
        modifier onlyPatient {
        if(patientID != msg.sender) {
            revert();
        } else {
            _;
        }
    }
    
    modifier onlyPatientorDoctor {
        if((patientID == msg.sender) || (doctorID == msg.sender)) {
            _;
        } else {
            revert();
        }
    }
    
    modifier notPatient {
        if(patientID == msg.sender) {
            revert();
        } else {
            _;
        }
    }
    
    function requestAccess() public notPatient {
        messages = 'Access to records is being requested';
        requestorID = msg.sender;
    }
    
    function allowAccess(bool access) public onlyPatientorDoctor {
        if(access == true){
        messages = 'Access to records is granted';
        doctorID = requestorID;
        } else {
            messages = 'Access to records is denied';
        }
    }
    
    function stopAccess() public onlyPatient {
        messages = 'Access to records has been stopped';
        doctorID = 0;
    }
    
    modifier onlyDoctor {
        if(doctorID != msg.sender) {
            revert();
        } else {
            _;
        }
    } 
    
    function viewRecord() public onlyPatientorDoctor view returns(string,uint,uint,uint,string,string) {
        
            return (name, age, weight, height, allergies, medicine);
    }
    
    function updateName(string newName) public onlyDoctor returns(string) {
        name = newName;
    }
    
    function updateAge(uint newAge) public onlyDoctor returns(uint) {
        age = newAge;
    }
    
    function updateWeight(uint newWeight) public onlyDoctor returns(uint) {
        weight = newWeight;
    }
    
    function updateHeight(uint newHeight) public onlyDoctor returns(uint) {
        height = newHeight;
    }
    
    function updateAllergies(string newAllergies) public onlyDoctor returns(string) {
        allergies = newAllergies;
    }
    
    function updateMedicine(string newMedicine) public onlyDoctor returns(string) {
        medicine = newMedicine;
    }    
    
}