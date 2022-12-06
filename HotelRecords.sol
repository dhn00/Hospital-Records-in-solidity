pragma solidity ^0.8.5;

// This contract stores medical records for patients in a hospital

// Define a struct for storing medical record data
struct MedicalRecord {
  // The patient's name
  string name;
  // The patient's medical history
  string medicalHistory;
  // The patient's current medications
  string medications;
  // The patient's current medical conditions
  string conditions;
  // The date of the patient's last visit
  uint256 lastVisit;
}

// Define a mapping to store the medical records
// The mapping keys will be the patient's address
mapping (address => MedicalRecord) public records;

// Define a function for adding a new medical record
function addRecord(string memory _name, string memory _medicalHistory, string memory _medications, string memory _conditions, uint256 _lastVisit) public {
  // Create a new medical record
  MedicalRecord memory newRecord = MedicalRecord(_name, _medicalHistory, _medications, _conditions, _lastVisit);
  // Store the medical record in the mapping
  records[msg.sender] = newRecord;
}

// Define a function for updating an existing medical record
function updateRecord(string memory _medicalHistory, string memory _medications, string memory _conditions, uint256 _lastVisit) public {
  // Retrieve the patient's medical record
  MedicalRecord memory record = records[msg.sender];
  // Update the record's data
  record.medicalHistory = _medicalHistory;
  record.medications = _medications;
  record.conditions = _conditions;
  record.lastVisit = _lastVisit;
  // Store the updated record in the mapping
  records[msg.sender] = record;
}
