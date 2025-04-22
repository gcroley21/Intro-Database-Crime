drop database if exists Crime_Montgomery_County;
Create Database Crime_Montgomery_County;

use Crime_Montgomery_County;

Create Table Offence
(
	Offence_Code	varchar(10)		primary key  Not null,	
    NIBRS_Code		char(4)			Not Null,		
	Crime_name1		varchar(50)		Not Null,
    Crime_name2		varchar(100)	Not Null,
    Crime_name3		varchar(100)	Not Null
);

Create Table Incidents
(
	Incident_id				varchar(20)		primary key		Not Null,
    Offence_Code			varchar(10)		Not Null,
    Case_Number				int				Not Null,
    Dispatch_Date_Time		datetime		Null,
    Start_Date_Time			datetime		Not Null,
    End_Date_Time			datetime		Null,
    Victims					int(1)			Not Null,
    Agency					varchar(100)	Not Null,
    Place					varchar(100)	Null,
    Police_District_Name	varchar(50)		Not Null,
    Police_District_Number	varchar(10)		Not Null,		
    Location				varchar(50)		Null,
    Lattitude				float			Not Null,
    Longitude				float			Not Null,
        CONSTRAINT fk_incident_offence
        FOREIGN KEY (offence_code)
        REFERENCES Offence(offence_code)
);

Create Table Address
(
	Incident_id			varchar(20)		primary key		Not Null,
    Block_address		varchar(100)	Not Null,
    Address_number		int(10)			Null,		
	Street_prefix		Char(5)			Null,
    Street_name			varchar(50)		Not Null,
    Street_suffix		Char(10)		Null,
    Street_type			char(10)		Null,
    City				varchar(50)		Not Null,
    State				char(2)			Not Null,
    Zip_Code			char(10)		Null,
        CONSTRAINT fk_address_incident
        FOREIGN KEY (incident_id)
        REFERENCES Incidents(incident_id)
);

Create Table Geography
(
  incident_id 	VARCHAR(20) PRIMARY KEY NOT NULL,
  sector 	VARCHAR(10) NULL,
  beat 	VARCHAR(10) NULL,
  pra 	VARCHAR(10) NULL,
      CONSTRAINT fk_geo_incident
        FOREIGN KEY (incident_id)
        REFERENCES Incidents(incident_id)
);