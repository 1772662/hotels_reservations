<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Hotels Model
 *
 * @property \App\Model\Table\RoomBookingsTable&\Cake\ORM\Association\HasMany $RoomBookings
 * @property \App\Model\Table\FilesTable&\Cake\ORM\Association\BelongsToMany $Files
 *
 * @method \App\Model\Entity\Hotel get($primaryKey, $options = [])
 * @method \App\Model\Entity\Hotel newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\Hotel[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Hotel|false save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Hotel saveOrFail(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Hotel patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\Hotel[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\Hotel findOrCreate($search, callable $callback = null, $options = [])
 *
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class HotelsTable extends Table
{
    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->setTable('hotels');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->hasMany('RoomBookings', [
            'foreignKey' => 'hotel_id'
        ]);
        $this->belongsToMany('Files', [
            'foreignKey' => 'hotel_id',
            'targetForeignKey' => 'file_id',
            'joinTable' => 'hotels_files'
        ]);
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->integer('id')
            ->allowEmptyString('id', null, 'create');

        $validator
            ->scalar('hotel_name')
            ->maxLength('hotel_name', 255)
            ->requirePresence('hotel_name', 'create')
            ->notEmptyString('hotel_name');

        $validator
            ->scalar('hotel_address')
            ->maxLength('hotel_address', 255)
            ->requirePresence('hotel_address', 'create')
            ->notEmptyString('hotel_address');

        $validator
            ->scalar('hotel_postcode')
            ->maxLength('hotel_postcode', 255)
            ->requirePresence('hotel_postcode', 'create')
            ->notEmptyString('hotel_postcode');

        $validator
            ->scalar('url')
            ->maxLength('url', 255)
            ->requirePresence('url', 'create')
            ->notEmptyString('url');

        return $validator;
    }
}
