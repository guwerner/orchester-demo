
using orchester from '../db/orchester';

service OrchesterService {
    entity Musican as projection on orchester.Musican;
    entity Band  as projection on orchester.Band;
    entity Concert as projection on orchester.Concert;
    entity InstrumentType as projection on orchester.InstrumentType;
}

