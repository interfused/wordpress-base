<?php

/**
 * DOCS: 
 * https://codeception.com/docs/AcceptanceTests
 * https://codeception.com/docs/modules/WebDriver
 * 
 * Run test from command line
 * docker compose run --rm codecept run {TEST_SUITE} {TEST_CLASS}:{TEST_METHOD}
 * TEST_SUITE, TEST_CLASS, & TEST_METHOD are optional
 * 
 * EX:
 * docker compose run --rm codecept run Acceptance FirstTestCest:tryToTest
 */
namespace Tests\Acceptance;

use Tests\Support\AcceptanceTester;

class FirstTestCest
{
    public $standard_wait_secs = 5;
    public function _before(AcceptanceTester $I)
    {
    }

    // tests
    public function homepageTest(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->wait($this->standard_wait_secs);
        $I->see('WordPress');
    }
    public function googleTest(AcceptanceTester $I)
    {
        $I->amOnUrl('https://www.google.com');
        $I->wait($this->standard_wait_secs);
        $I->see('search');
    }
}
