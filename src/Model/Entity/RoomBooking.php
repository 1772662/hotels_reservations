<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * RoomBooking Entity
 *
 * @property int $id
 * @property int $booking_id
 * @property int $hotel_id
 * @property int $number_room
 * @property string $room_type
 * @property \Cake\I18n\FrozenTime|null $created
 * @property \Cake\I18n\FrozenTime|null $modified
 *
 * @property \App\Model\Entity\Booking $booking
 * @property \App\Model\Entity\Hotel $hotel
 */
class RoomBooking extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'booking_id' => true,
        'hotel_id' => true,
        'number_room' => true,
        'room_type' => true,
        'created' => true,
        'modified' => true,
        'booking' => true,
        'hotel' => true
    ];
}
