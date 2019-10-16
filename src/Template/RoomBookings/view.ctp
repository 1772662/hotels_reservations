<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\RoomBooking $roomBooking
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Room Booking'), ['action' => 'edit', $roomBooking->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Room Booking'), ['action' => 'delete', $roomBooking->id], ['confirm' => __('Are you sure you want to delete # {0}?', $roomBooking->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Room Bookings'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Room Booking'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Bookings'), ['controller' => 'Bookings', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Booking'), ['controller' => 'Bookings', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Hotels'), ['controller' => 'Hotels', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Hotel'), ['controller' => 'Hotels', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="roomBookings view large-9 medium-8 columns content">
    <h3><?= h($roomBooking->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row"><?= __('Booking') ?></th>
            <td><?= $roomBooking->has('booking') ? $this->Html->link($roomBooking->booking->id, ['controller' => 'Bookings', 'action' => 'view', $roomBooking->booking->id]) : '' ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Hotel') ?></th>
            <td><?= $roomBooking->has('hotel') ? $this->Html->link($roomBooking->hotel->id, ['controller' => 'Hotels', 'action' => 'view', $roomBooking->hotel->id]) : '' ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Room Type') ?></th>
            <td><?= h($roomBooking->room_type) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Id') ?></th>
            <td><?= $this->Number->format($roomBooking->id) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Number Room') ?></th>
            <td><?= $this->Number->format($roomBooking->number_room) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Created') ?></th>
            <td><?= h($roomBooking->created) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Modified') ?></th>
            <td><?= h($roomBooking->modified) ?></td>
        </tr>
    </table>
</div>
