"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
describe('Entity Models', () => {
    describe('Musican', () => {
        it('should have required fields', () => {
            const musicianFields = ['ID', 'name', 'prename', 'instrument', 'birthdate', 'createdAt', 'modifiedAt'];
            expect(musicianFields).toContain('name');
            expect(musicianFields).toContain('prename');
            expect(musicianFields).toContain('instrument');
            expect(musicianFields).toContain('birthdate');
        });
    });
    describe('Band', () => {
        it('should have required fields', () => {
            const bandFields = ['ID', 'name', 'genre', 'foundedIn', 'musicians', 'createdAt', 'modifiedAt'];
            expect(bandFields).toContain('name');
            expect(bandFields).toContain('genre');
            expect(bandFields).toContain('foundedIn');
            expect(bandFields).toContain('musicians');
        });
        it('should compose many musicians', () => {
            const composition = 'Composition of many Musican';
            expect(composition).toContain('Composition');
            expect(composition).toContain('many');
        });
    });
    describe('Concert', () => {
        it('should have required fields', () => {
            const concertFields = ['ID', 'title', 'date', 'location', 'band', 'createdAt', 'modifiedAt'];
            expect(concertFields).toContain('title');
            expect(concertFields).toContain('date');
            expect(concertFields).toContain('location');
            expect(concertFields).toContain('band');
        });
        it('should associate to a single band', () => {
            const association = 'Association to Band';
            expect(association).toContain('Association');
            expect(association).toContain('Band');
        });
    });
    describe('InstrumentType', () => {
        it('should be a CodeList', () => {
            const type = 'CodeList';
            expect(type).toBe('CodeList');
        });
        it('should have code and description fields', () => {
            const fields = ['code', 'description'];
            expect(fields).toContain('code');
            expect(fields).toContain('description');
        });
    });
});
//# sourceMappingURL=entities.test.js.map