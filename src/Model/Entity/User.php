<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;
use Cake\Auth\DefaultPasswordHasher ;

/**
 * User Entity
 *
 * @property int $id
 * @property string $username
 * @property string $role
 * @property string $address
 * @property string $phone
 * @property string $email
 * @property string $password
 * @property \Cake\I18n\FrozenTime|null $created
 * @property \Cake\I18n\FrozenTime|null $modified
 *
 * @property \App\Model\Entity\Booking[] $bookings
 */
class User extends Entity
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
        'username' => true,
        'role' => true,
        'address' => true,
        'phone' => true,
        'email' => true,
        'password' => true,
        'created' => true,
        'modified' => true,
        'bookings' => true
    ];


protected function _setPassword($password) {

  return ( new DefaultPasswordHasher)->hash($password) ;

}




    /**
     * Fields that are excluded from JSON versions of the entity.
     *
     * @var array
     */
    protected $_hidden = [
        'password'
    ];
}
