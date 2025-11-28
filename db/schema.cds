using {
                           cuid,
                           managed,
    sap.common.CodeList as CodeList
} from '@sap/cds/common';

namespace orchester;

entity Band : managed {
    key bandID     : UUID;
        bandName   : String(50) @title: '{i18n>Band}';
        genre      : String(20) @title: '{i18n>Genre}';
        foundedIn  : Date       @title: '{i18n>FoundedIn}';
        to_musican : Composition of many BandMembers
                         on to_musican.to_band = $self;
};

@odata.draft.enabled
entity Musican : managed {
    key musicanID     : UUID;
        name          : String(30)                    @title: '{i18n>LastName}';
        prename       : String(30)                    @title: '{i18n>FirstName}';
        instrument    : String(50)                    @title: '{i18n>Instruments}';
        birthdate     : Date                          @title: '{i18n>Birthdate}';
        musicanStatus : Association to MusicanStatus  @title: '{i18n>Status}' @default: 'I' @mandatory;
        to_band       : Composition of many BandMembers
                            on to_band.to_musican = $self;
};

entity BandMembers : cuid, managed {
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
        date      : Date;
        location  : String(50);
        to_band   : Association to Band;
};

//
//  Code Lists
//

@odata.draft.enabled
entity InstrumentType : CodeList {
    key code        : String(10);
        description : String(100);
}

type MusicanStatusCode : String(1) enum {
    Active = 'A';
    Inactive = 'I';
}

entity MusicanStatus : CodeList {
    key code : MusicanStatusCode;
}
