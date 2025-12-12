using {orchester as schema} from '../db/schema.cds';


annotate schema.Musican with @title: '{i18n>Musican}' {
    musicanID       @UI.Hidden;
    name            @title         : '{i18n>LastName}';
    prename         @title         : '{i18n>FirstName}';
    instrument      @title         : '{i18n>Instruments}';
    birthdate       @title         : '{i18n>Birthdate}';
    musicanStatus   @title: '{i18n>Status}'   @Common.Text: musicanStatus.name;
    to_band         @title: '{i18n>Band}'     @Common.Text: to_band.bandName;
    musicanAbility  @title: '{i18n>ability}'  @Common.Text: musicanAbility.name;

};


annotate schema.Band with @title: '{i18n>Band}' {
    bandID      @UI.Hidden;
    bandName    @title          : '{i18n>Band}';
    genre       @title          : '{i18n>Genre}';
    foundedIn   @title          : '{i18n>FoundedIn}';
    to_musican  @title: '{i18n>Musican}'  @Common.Text: to_musican.name;
};

annotate schema.Concert with @title: '{i18n>Concert}' {
    concertID @UI.Hidden;
    title     @title               : '{i18n>concertName}';
    concertDate      @title        :'{i18n>concertDate}';
    time      @title               : '{i18n>concertTime}';
    inlettime @title               : '{i18n>inletTime}';
    location  @title               : '{i18n>location}';
    actual    @title : '{i18n>actual}'

};

annotate schema.Address with @title: '{i18n>Address}' {
    addressID  @title : '{i18n>addressID}';
    street     @title : '{i18n>street}';
    city       @title : '{i18n>city}';
    postalCode @title : '{i18n>postalCode}';
    country    @title : '{i18n>country}'
};

