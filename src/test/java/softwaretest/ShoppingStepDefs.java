package softwaretest;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ShoppingStepDefs extends AbstractStepDefs {

    @Given("the {string} is added to the cart")
    public void somethingIsAddedToTheCart(String item) {
        homePage.addItemToCart(item);
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

}
