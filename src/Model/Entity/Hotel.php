<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Hotel Entity
 *
 * @property int $id
 * @property string $hotel_name
 * @property string $hotel_address
 * @property string $hotel_postcode
 * @property string $url
 * @property \Cake\I18n\FrozenTime|null $created
 * @property \Cake\I18n\FrozenTime|null $modified
 *
 * @property \App\Model\Entity\RoomBooking[] $room_bookings
 * @property \App\Model\Entity\File[] $files
 */
class Hotel extends Entity
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
        'hotel_name' => true,
        'hotel_address' => true,
        'hotel_postcode' => true,
        'url' => true,
        'created' => true,
        'modified' => true,
        'room_bookings' => true,
        'files' => true
    ];
}
