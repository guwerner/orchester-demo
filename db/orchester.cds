using {
  cuid,
  managed,
  sap.common.CodeList as CodeList
} from '@sap/cds/common';

namespace orchester;

entity Musican : cuid, managed {
    name: String(100);
    prename: String (100);
    instrument: String(100);
    birthdate: Date;
    band: Association to Band;
};

entity Band : cuid, managed {
    name: String(100);
    genre: String(100);
    foundedIn: Date;
    musicians: Composition of many Musican on musicians.band = $self;
};

entity Concert : cuid, managed {
    title: String(100);
    date: Date;
    location: String(100);
    band: Association to Band;
};

entity InstrumentType : CodeList {
    key code : String(10);
    description : String(100);
}

