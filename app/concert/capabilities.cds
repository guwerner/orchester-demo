using MusicanService from '../../srv/musican-service';

annotate MusicanService.Concert with @odata.draft.enabled;

annotate MusicanService.Concert with @Common.SemanticKey: ['concertID'];
