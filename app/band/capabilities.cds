using BandService from '../../srv/band-service';

annotate BandService.Band   with @Common.SemanticKey: ['bandID'];
annotate BandService.Musican  with @Common.SemanticKey: ['musicanID'];

