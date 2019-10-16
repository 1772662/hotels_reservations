<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\Event\Event ;
use Cake\ORM\TableRegistry;
/**
 * Users Controller
 *
 * @property \App\Model\Table\UsersTable $Users
 *
 * @method \App\Model\Entity\User[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class UsersController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null
     */
    public function index()
    {

      $session = $this->request->session();
      $user_id = $session->read('Auth.User.id');
      $role   = $session->read('Auth.User.role');
    if (isset($role) && $role === 'admin')
    {
      $users = $this->paginate($this->Users);
    }
    else {
      $users = $this->paginate($this->Users->find()->where(['Users.id'=> $user_id ]));

    }
        $this->set(compact('users'));
    }

    /**
     * View method
     *
     * @param string|null $id User id.
     * @return \Cake\Http\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $user = $this->Users->get($id, [
            'contain' => ['Bookings']
        ]);

        $this->set('user', $user);
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null Redirects on successful add, renders view otherwise.
     */
    public function add()
    {

        $user = $this->Users->newEntity();
        if ($this->request->is('post')) {

            $user = $this->Users->patchEntity($user, $this->request->getData());

            if ($this->Users->save($user)) {
              $this->Flash->success(__('The user has been saved. '    ));
              return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The user could not be saved. Please, try again.'));
        }
        $this->set(compact('user'));


    }



    /**
     * Edit method
     *
     * @param string|null $id User id.
     * @return \Cake\Http\Response|null Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $user = $this->Users->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $user = $this->Users->patchEntity($user, $this->request->getData());
            if ($this->Users->save($user)) {
                $this->Flash->success(__('The user has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The user could not be saved. Please, try again.'));
        }
        $this->set(compact('user'));
    }

    /**
     * Delete method
     *
     * @param string|null $id User id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $user = $this->Users->get($id);
        if ($this->Users->delete($user)) {
            $this->Flash->success(__('The user has been deleted.'));
        } else {
            $this->Flash->error(__('The user could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }


// Login

public function login() {
  if ($this->request->is('post'))
    {
        $user = $this->Auth->identify();
          if ($user)
            {
                $this->Auth->setUser($user);
                return $this->redirect(['controller' =>'Bookings' ]) ;
    }
            // BAd login
            $this->Flash->error('Incorrect Login.....');

            }
          }

public function logout() {
  $this->Flash->success('You are logged out') ;
  $session = $this->request->session();
  $session->destroy();
  return $this->redirect($this->Auth->logout());
}



 public function confirm($id = null)
 {

   $tusers = TableRegistry::get('Users');
   $tuser = $tusers->get($id); // Return article with id 12

   $tuser->confirmed = true;
   $tusers->save($tuser);

   return $this->redirect(['action' => 'index']);
//    $this->set(compact('user'));
 }





public function register() {

$user = $this->Users->newEntity();

if ($this->request->is('post'))
{

  $user= $this->Users->patchEntity($user,$this->request->data) ;

 if($this->Users->save($user))
    {
      $this->Flash->success('You are registred and can login');


  $id = $user->id;

	 return $this->redirect(['controller' =>'Emails','action' => 'index',$id ]);

    }
    else
    {
        $this->Flash->error('your are not register .....');
      }
}
   $this->set(compact('user')) ;
   $this->set('_serialzie',['user']) ;
}




public function beforeFilter(Event  $event)
{

$this->Auth->allow(['register']) ;

}

}
