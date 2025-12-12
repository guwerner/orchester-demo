using MusicanService from '../../srv/musican-service';

annotate MusicanService.Musican with @odata.draft.enabled;

//annotate MusicanService.Band   with @Common.SemanticKey: ['bandID'];
annotate MusicanService.Musican  with @Common.SemanticKey: ['musicanID'];


