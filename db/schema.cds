using { cuid, managed, sap  } from '@sap/cds/common';

namespace orchester;


entity Band : managed {
    key bandID     : UUID;
        bandName   : String(50);
        genre      : String(20);
        foundedIn  : Date;
        to_musican : Composition of many Band2Musicans
                         on to_musican.to_band = $self;
        to_concert : Composition of many Band2Concerts
                        on to_concert.to_band = $self;                    
};

@odata.draft.enabled
entity Musican : managed {
    key musicanID     : UUID;
        name          : String(20);                  
        prename       : String(25);                  
        instrument    : String(20);                  
        birthdate     : Date;                        
        musicanStatus : Association to MusicanStatus  default 'I'    @readonly ; 
        to_band       : Composition of many Band2Musicans
                            on to_band.to_musican = $self;
        musicanAbility : Association to MusicanAblitity  default 1    @readonly ;                          
                     
};

entity Band2Musicans : cuid {
    to_band    : Association to Band;
    to_musican : Association to Musican;
    joinDate   : Date; 
  };
 entity Stage : managed {
    key stageID     : UUID;
        name        : String(50);
        location    : String(50);
        capacity    : Integer;
        description : String(255);
};

entity Concert : managed {
    key concertID : UUID;
        title     : String(50);
        concertDate      : Date;
        time      : Time;
        inlettime : Time;
        location  : String(50);
        to_band   : Composition of many Band2Concerts
                    on to_band.to_concert = $self;
virtual actual    : Boolean;            
};

entity Band2Concerts : cuid {
    to_band: Association to Band;
    to_concert: Association to Concert
}
//
//  Code Lists
//

@odata.draft.enabled
entity InstrumentType :  sap.common.CodeList {
    key code        : String(10);
        description : String(100);
}

type MusicanStatusCode : String(1) enum {
    Active = 'A';
    Inactive = 'I';
}

@cds.odata.valuelist
entity MusicanStatus :  sap.common.CodeList {
    key code : MusicanStatusCode;
}

type MusicanAblitityCode: UInt8 enum {
    Starter = 1;
    Advanced = 2;
    Amateur = 3;
    Profi   = 4;
    Expert   = 5;
}
@cds.odata.valuelist
entity MusicanAblitity :  sap.common.CodeList {
    key code : MusicanAblitityCode;
    descr : String(100);
}


/////////////////////
// Views
/////////////////////

define View GenreView as 
select from Band distinct {
    key genre 
}

define View InstrumentView as
select from Musican distinct {
    key instrument
}