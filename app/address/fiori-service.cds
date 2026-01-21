using AddressService from '../../srv/address-service';

// Address List Page Annotations
annotate AddressService.Address with @(
    UI: {
        LineItem: [
            {$Type: 'UI.DataField', Value: addressID, Label: '{i18n>addressID}'},
            {$Type: 'UI.DataField', Value: street, Label: '{i18n>street}'},
            {$Type: 'UI.DataField', Value: houseNumber, Label: '{i18n>houseNumber}'},
            {$Type: 'UI.DataField', Value: city, Label: '{i18n>city}'},
            {$Type: 'UI.DataField', Value: postalCode, Label: '{i18n>postalCode}'},
            {$Type: 'UI.DataField', Value: country, Label: '{i18n>country}'}
        ],
        PresentationVariant: {
            Visualizations: ['@UI.LineItem'],
            SortOrder: [{
                $Type: 'Common.SortOrderType',
                Property: 'city',
                Descending: false
            }]
        }
    }
);

// Address Object Page Annotations
annotate AddressService.Address with @(
    UI: {
        HeaderInfo: {
            Title: {
                $Type: 'UI.DataField',
                Value: street
            },
            TypeName: '{i18n>Address}',
            TypeNamePlural: '{i18n>Addresses}',
            Description: {Value: city}
        },
        FieldGroup #AddressDetails: {
            Data: [
                {$Type: 'UI.DataField', Value: addressID, Label: '{i18n>addressID}'},
                {$Type: 'UI.DataField', Value: street, Label: '{i18n>street}'},
                {$Type: 'UI.DataField', Value: houseNumber, Label: '{i18n>houseNumber}'},
                {$Type: 'UI.DataField', Value: city, Label: '{i18n>city}'},
                {$Type: 'UI.DataField', Value: postalCode, Label: '{i18n>postalCode}'},
                {$Type: 'UI.DataField', Value: country, Label: '{i18n>country}'}
            ]
        },
        Facets: [
            {
                $Type: 'UI.ReferenceFacet',
                Label: '{i18n>AddressDetails}',
                Target: '@UI.FieldGroup#AddressDetails'
            }
        ]
    }
);
