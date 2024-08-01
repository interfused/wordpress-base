<?php

/**
 * DOCS: https://codeception.com/docs/AcceptanceTests
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
    public function tryToTest(AcceptanceTester $I)
    {
        //$I->amOnPage('/');
        $I->amOnPage('https://www.stackoverflow.com');
        $I->wait($this->standard_wait_secs);
        $I->see('search');
    }
}
