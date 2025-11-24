using {
                           cuid,
                           managed,
    sap.common.CodeList as CodeList
} from '@sap/cds/common';

namespace orchester;
@odata.draft.enabled
entity Musican : cuid, managed {
    name       : String(50)  @title : '{i18n>LastName}';
    prename    : String(50)  @title : '{i18n>FirstName}' ;
    instrument : String(50)  @title : '{i18n>Instruments}';
    birthdate  : Date;
    status     : Boolean   @default : false;
    band       : Association to Band;
};

entity Band : cuid, managed {
    bandName  : String(50);
    genre     : String(50);
    foundedIn : Date;
    musicians : Composition of many Musican
                    on musicians.band = $self;
};
@odata.draft.enabled
entity Concert : cuid, managed {
    title    : String(50);
    date     : Date;
    location : String(50);
    band     : Association to Band;
};
@odata.draft.enabled
entity InstrumentType : CodeList {
    key code        : String(10);
        description : String(100);
}
