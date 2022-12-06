describe('Cypress Example', () => {

	const is_a_number = value => {
		expect(Number.isNaN(+value), 'input should be a number').to.eq(false)
	}


	// Commands ------------------------------------------------------

	//Cypress.Commands.add('navigate', (item) => {
	//	cy.get("#nav").contains(item).should('be.visible').click();
	//})

	// Each --------------------------------------------------------------------

	beforeEach(() => {
		cy.visit('');  // Navigate to Env variable `CYPRESS_BASE_URL`
		// Local storage is reset per test, so the user should not be logged in
	});

	// Tests -------------------------------------------------------------------

	it('contains inputs', () => {
		cy.get('h1').should('contain.text', 'CICD');
		cy.get('#example_input').should('be.visible');
		
		cy.get('#example_output').should('not.contain.value', 'hello')
		cy.get('#example_input').type("hello");
		cy.get('#example_submit').click();
		cy.get('#example_output').should('contain.value', 'hello')
	});

});