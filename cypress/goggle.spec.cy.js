describe('Google Search UK', () => {
	it('Search for university webpage and check university logo is present', () => {
		cy.visit("https://www.google.co.uk?&hl=en&lr=lang_en")
		cy.get('button').contains("Accept all").scrollIntoView().should('be.visible').click()
		cy.get('input[title="Search"]').should('be.visible').type("Canterbury christ chcurch uni{enter}")
		cy.contains("canterbury.ac.uk").click()
		cy.get("#onetrust-accept-btn-handler").click()
		cy.get('img[alt="Canterbury Christ Church University Logo"]').should('be.visible')
	})
})