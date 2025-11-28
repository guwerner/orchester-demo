using AdminService from '../../srv/admin-service';

annotate AdminService.Band   with @Common.SemanticKey: ['bandID'];
annotate AdminService.Musican  with @Common.SemanticKey: ['musicanID'];

