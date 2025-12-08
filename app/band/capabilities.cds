using BandService from '../../srv/band-service';

annotate BandService.Musican with @odata.draft.enabled;

annotate BandService.Band   with @Common.SemanticKey: ['bandID'];
//annotate BandService.Musican  with @Common.SemanticKey: ['musicanID'];

