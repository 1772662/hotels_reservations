<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\RoomBooking $roomBooking
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $roomBooking->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $roomBooking->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Room Bookings'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Bookings'), ['controller' => 'Bookings', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Booking'), ['controller' => 'Bookings', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Hotels'), ['controller' => 'Hotels', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Hotel'), ['controller' => 'Hotels', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="roomBookings form large-9 medium-8 columns content">
    <?= $this->Form->create($roomBooking) ?>
    <fieldset>
        <legend><?= __('Edit Room Booking') ?></legend>
        <?php
            echo $this->Form->control('booking_id', ['options' => $bookings]);
            echo $this->Form->control('hotel_id', ['options' => $hotels]);
            echo $this->Form->control('number_room');
            echo $this->Form->control('room_type');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
