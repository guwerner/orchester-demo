using AdminService from '../../srv/admin-service';


////////////////////////////////////////////////////////////////////////////
//
//	Books List Page
//
annotate AdminService.Musican with @(UI: {
  SelectionFields: [
    cuid,
    prename,
    lastname,
	instrument

  ],
  LineItem       : [
    {
      Value: cuid,
      Label: '{i18n>Title}'
    },
    {
      Value: prename,
      Label: '{i18n>LastName}'
    },
    {Value: band.bandName},
    {Value: birthdate},
    
  ]
});



////////////////////////////////////////////////////////////////////////////
//
//	Books Object Page
//
annotate AdminService.Musican with @(
	UI: {
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}', Target: '@UI.FieldGroup#Admin'},
		],
		FieldGroup#General: {
			Data: [
				{Value: name},
				{Value: prename},
				{Value: birthdate},
			]
		},
		FieldGroup#Details: {
			Data: [
				{Value: band_ID}
			]
		},
		FieldGroup#Admin: {
			Data: [
				{Value: createdBy},
				{Value: createdAt},
				{Value: modifiedBy},
				{Value: modifiedAt}
			]
		}
	}
);
