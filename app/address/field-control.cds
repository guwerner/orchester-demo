using AddressService from '../../srv/address-service';

// Field controls and value lists for Address
annotate AddressService.Address with {
    ID @Core.Computed;
    
    addressID @(
        title: '{i18n>addressID}',
        Common.ValueListWithFixedValues: false
    );
    
    street @(
        title: '{i18n>street}',
        Common.ValueListWithFixedValues: false,
        Common.FieldControl: #Mandatory
    );
    
    houseNumber @(
        title: '{i18n>houseNumber}',
        Common.ValueListWithFixedValues: false
    );
    
    city @(
        title: '{i18n>city}',
        Common.ValueListWithFixedValues: false,
        Common.FieldControl: #Mandatory
    );
    
    postalCode @(
        title: '{i18n>postalCode}',
        Common.ValueListWithFixedValues: false,
        Common.FieldControl: #Mandatory
    );
    
    country @(
        title: '{i18n>country}',
        Common.ValueListWithFixedValues: false,
        Common.FieldControl: #Mandatory
    );
}
