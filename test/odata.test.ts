import cds from '@sap/cds'
import { Musican } from '#cds-models/MusicanService'
const { GET, POST, PATCH, axios, expect } = cds.test(__dirname+'/..')
// const EDIT = (url) => POST (url+'/MusicanService.draftEdit',{})
// const SAVE = (url) => POST (url+'/MusicanService.draftActivate')

describe('Basic OData', () => {

 it('serves $metadata documents in v4', async () => {
    const { headers, status, data } = await GET `/odata/v4/musican/$metadata`
    expect(status).to.equal(200)
    expect(headers).to.contain({
      // 'content-type': 'application/xml', //> fails with 'application/xml;charset=utf-8', which is set by express
      'odata-version': '4.0',
    })
    expect(headers['content-type']).to.match(/application\/xml/)
    expect(data).to.contain('<EntitySet Name="Musican" EntityType="MusicanService.Musican">')
    expect(data).to.contain('<Annotation Term=\"Common.Label\" String=\"Name\"/>')
  })
})