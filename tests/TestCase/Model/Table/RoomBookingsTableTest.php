<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\RoomBookingsTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\RoomBookingsTable Test Case
 */
class RoomBookingsTableTest extends TestCase
{
    /**
     * Test subject
     *
     * @var \App\Model\Table\RoomBookingsTable
     */
    public $RoomBookings;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.RoomBookings',
        'app.Bookings',
        'app.Hotels'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::getTableLocator()->exists('RoomBookings') ? [] : ['className' => RoomBookingsTable::class];
        $this->RoomBookings = TableRegistry::getTableLocator()->get('RoomBookings', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->RoomBookings);

        parent::tearDown();
    }

    /**
     * Test initialize method
     *
     * @return void
     */
    public function testInitialize()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test validationDefault method
     *
     * @return void
     */
    public function testValidationDefault()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test buildRules method
     *
     * @return void
     */
    public function testBuildRules()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
