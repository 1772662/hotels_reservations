<?php
   namespace App\Controller;
   use App\Controller\AppController;
   use Cake\Mailer\Email;

   class EmailsController extends AppController{
      public function index($id=null){

   		  $confirmation_link = "http://" . $_SERVER['HTTP_HOST'] . $this->request->webroot . "Users/confirm/" .$id;

         $email = new Email('default');
         $email->to('amina.atmane@hotmail.com')->subject('CakePhP - Confirmation enregistrement.')->send($confirmation_link);
        

	  }
   }
?>
