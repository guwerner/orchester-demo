using MusicanService from '../../srv/musican-service';

annotate MusicanService.Band   with @Common.SemanticKey: ['bandID'];
annotate MusicanService.Musican  with @Common.SemanticKey: ['musicanID'];

