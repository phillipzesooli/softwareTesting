package softwaretest;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ShoppingStepDefs extends AbstractStepDefs {

    @Given("the {string} is added to the cart")
    public void somethingIsAddedToTheCart(String item) {
        homePage.addItemToCart(item);
    }

    @Given("the {string} is clicked")
    public void itemIsClicked(String item){
        homePage.clickItem(item);
    }
    @When("the tax is {string}")
    public void getTax(String tax) {
        assertEquals(tax, homePage.getTax());
    }

    @When("the subtotal reads {string}")
    public void theSubtotalReads(String subtotal){
        assertEquals(subtotal, homePage.getSubtotal());
    }

    @When("the total price after tax reads {string}")
    public void thePriceShouldRead(String total) {
        assertEquals(total, homePage.getTotal());
    }

    @Then("the error message should read {string}")
    public void errorMessageAtCheckoutIsShown(String errorMessage){
        assertEquals(errorMessage, homePage.getCheckoutErrorMessage());
    }
    @And("the page is reset")
    public void pageIsReset() {
        homePage.pageReset();
    }

    @Then("the {string} page is opened")
    public void pageIsOpened(String link) {
        assertEquals(link, homePage.getPageUrl());

    }

    @Then("the description of the product should read {string}")
    public void theDescriptionOfTheProductShouldReadDetails(String description) {
        assertEquals(description, homePage.getDetails());
    }

    @Then("the about page error message should read {string}")
    public void theAboutPageErrorMessageShouldReadNotFound(String error) {
        assertEquals(error, homePage.getAboutError());
    }
}
