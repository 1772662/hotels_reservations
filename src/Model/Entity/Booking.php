<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Booking Entity
 *
 * @property int $id
 * @property int $user_id
 * @property \Cake\I18n\FrozenDate|null $date_debut_sejour
 * @property \Cake\I18n\FrozenDate|null $date_fin_sejour
 * @property \Cake\I18n\FrozenTime|null $created
 * @property \Cake\I18n\FrozenTime|null $modified
 *
 * @property \App\Model\Entity\User $user
 * @property \App\Model\Entity\RoomBooking[] $room_bookings
 */
class Booking extends Entity
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
        'user_id' => true,
        'date_debut_sejour' => true,
        'date_fin_sejour' => true,
        'created' => true,
        'modified' => true,
        'user' => true,
        'room_bookings' => true
    ];
}
