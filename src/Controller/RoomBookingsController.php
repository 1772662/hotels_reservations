<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * RoomBookings Controller
 *
 * @property \App\Model\Table\RoomBookingsTable $RoomBookings
 *
 * @method \App\Model\Entity\RoomBooking[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class RoomBookingsController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['Bookings', 'Hotels']
        ];
        $roomBookings = $this->paginate($this->RoomBookings);

        $this->set(compact('roomBookings'));
    }

    /**
     * View method
     *
     * @param string|null $id Room Booking id.
     * @return \Cake\Http\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $roomBooking = $this->RoomBookings->get($id, [
            'contain' => ['Bookings', 'Hotels']
        ]);

        $this->set('roomBooking', $roomBooking);
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $roomBooking = $this->RoomBookings->newEntity();
        if ($this->request->is('post')) {
            $roomBooking = $this->RoomBookings->patchEntity($roomBooking, $this->request->getData());
            if ($this->RoomBookings->save($roomBooking)) {
                $this->Flash->success(__('The room booking has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The room booking could not be saved. Please, try again.'));
        }
        $bookings = $this->RoomBookings->Bookings->find('list', ['limit' => 200]);
        $hotels = $this->RoomBookings->Hotels->find('list', ['limit' => 200]);
        $this->set(compact('roomBooking', 'bookings', 'hotels'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Room Booking id.
     * @return \Cake\Http\Response|null Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $roomBooking = $this->RoomBookings->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $roomBooking = $this->RoomBookings->patchEntity($roomBooking, $this->request->getData());
            if ($this->RoomBookings->save($roomBooking)) {
                $this->Flash->success(__('The room booking has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The room booking could not be saved. Please, try again.'));
        }
        $bookings = $this->RoomBookings->Bookings->find('list', ['limit' => 200]);
        $hotels = $this->RoomBookings->Hotels->find('list', ['limit' => 200]);
        $this->set(compact('roomBooking', 'bookings', 'hotels'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Room Booking id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $roomBooking = $this->RoomBookings->get($id);
        if ($this->RoomBookings->delete($roomBooking)) {
            $this->Flash->success(__('The room booking has been deleted.'));
        } else {
            $this->Flash->error(__('The room booking could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
