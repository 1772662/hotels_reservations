<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Booking $booking
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Booking'), ['action' => 'edit', $booking->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Booking'), ['action' => 'delete', $booking->id], ['confirm' => __('Are you sure you want to delete # {0}?', $booking->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Bookings'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Booking'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Users'), ['controller' => 'Users', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New User'), ['controller' => 'Users', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Room Bookings'), ['controller' => 'RoomBookings', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Room Booking'), ['controller' => 'RoomBookings', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="bookings view large-9 medium-8 columns content">
    <h3><?= h($booking->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row"><?= __('User') ?></th>
            <td><?= $booking->has('user') ? $this->Html->link($booking->user->id, ['controller' => 'Users', 'action' => 'view', $booking->user->id]) : '' ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Id') ?></th>
            <td><?= $this->Number->format($booking->id) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Date Debut Sejour') ?></th>
            <td><?= h($booking->date_debut_sejour) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Date Fin Sejour') ?></th>
            <td><?= h($booking->date_fin_sejour) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Created') ?></th>
            <td><?= h($booking->created) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Modified') ?></th>
            <td><?= h($booking->modified) ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Room Bookings') ?></h4>
        <?php if (!empty($booking->room_bookings)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th scope="col"><?= __('Id') ?></th>
                <th scope="col"><?= __('Booking Id') ?></th>
                <th scope="col"><?= __('Hotel Id') ?></th>
                <th scope="col"><?= __('Number Room') ?></th>
                <th scope="col"><?= __('Room Type') ?></th>
                <th scope="col"><?= __('Created') ?></th>
                <th scope="col"><?= __('Modified') ?></th>
                <th scope="col" class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($booking->room_bookings as $roomBookings): ?>
            <tr>
                <td><?= h($roomBookings->id) ?></td>
                <td><?= h($roomBookings->booking_id) ?></td>
                <td><?= h($roomBookings->hotel_id) ?></td>
                <td><?= h($roomBookings->number_room) ?></td>
                <td><?= h($roomBookings->room_type) ?></td>
                <td><?= h($roomBookings->created) ?></td>
                <td><?= h($roomBookings->modified) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'RoomBookings', 'action' => 'view', $roomBookings->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'RoomBookings', 'action' => 'edit', $roomBookings->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'RoomBookings', 'action' => 'delete', $roomBookings->id], ['confirm' => __('Are you sure you want to delete # {0}?', $roomBookings->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
