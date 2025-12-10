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
    title     @title               : '{i18n>ConcertName}';
    concertDate      @title               : '{i18n>ConcertDate}';
    time      @title               : '{i18n>ConcertTime}';
    inlettime @title               : '{i18n>ConcertInlet}';
    location  @title               : '{i18n>location}';
    actual    @title : '{i18n>Actual}'



};
