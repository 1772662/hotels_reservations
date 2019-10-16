<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\RoomBooking[]|\Cake\Collection\CollectionInterface $roomBookings
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Room Booking'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Bookings'), ['controller' => 'Bookings', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Booking'), ['controller' => 'Bookings', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Hotels'), ['controller' => 'Hotels', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Hotel'), ['controller' => 'Hotels', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="roomBookings index large-9 medium-8 columns content">
    <h3><?= __('Room Bookings') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th scope="col"><?= $this->Paginator->sort('id') ?></th>
                <th scope="col"><?= $this->Paginator->sort('booking_id') ?></th>
                <th scope="col"><?= $this->Paginator->sort('hotel_id') ?></th>
                <th scope="col"><?= $this->Paginator->sort('number_room') ?></th>
                <th scope="col"><?= $this->Paginator->sort('room_type') ?></th>
                <th scope="col"><?= $this->Paginator->sort('created') ?></th>
                <th scope="col"><?= $this->Paginator->sort('modified') ?></th>
                <th scope="col" class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($roomBookings as $roomBooking): ?>
            <tr>
                <td><?= $this->Number->format($roomBooking->id) ?></td>
                <td><?= $roomBooking->has('booking') ? $this->Html->link($roomBooking->booking->id, ['controller' => 'Bookings', 'action' => 'view', $roomBooking->booking->id]) : '' ?></td>
                <td><?= $roomBooking->has('hotel') ? $this->Html->link($roomBooking->hotel->id, ['controller' => 'Hotels', 'action' => 'view', $roomBooking->hotel->id]) : '' ?></td>
                <td><?= $this->Number->format($roomBooking->number_room) ?></td>
                <td><?= h($roomBooking->room_type) ?></td>
                <td><?= h($roomBooking->created) ?></td>
                <td><?= h($roomBooking->modified) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $roomBooking->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $roomBooking->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $roomBooking->id], ['confirm' => __('Are you sure you want to delete # {0}?', $roomBooking->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="paginator">
        <ul class="pagination">
            <?= $this->Paginator->first('<< ' . __('first')) ?>
            <?= $this->Paginator->prev('< ' . __('previous')) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next(__('next') . ' >') ?>
            <?= $this->Paginator->last(__('last') . ' >>') ?>
        </ul>
        <p><?= $this->Paginator->counter(['format' => __('Page {{page}} of {{pages}}, showing {{current}} record(s) out of {{count}} total')]) ?></p>
    </div>
</div>
