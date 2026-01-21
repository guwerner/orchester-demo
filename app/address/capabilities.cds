using AddressService from '../../srv/address-service';

annotate AddressService.Address with @odata.draft.enabled;

annotate AddressService.Address with @Common.SemanticKey: ['ID'];
