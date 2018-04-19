<?php
// проверка константы запрет на доступ
defined('ISHOP') or die('Access denied'); ?>
<div class="content">
			<h2>Заказ № <?=$order_id?> <?=$state?></h2>
<?php if($show_order): ?>

<p>
<?php if($show_order[0]['status'] == 0): ?>
<a href="?view=orders&amp;confirm=<?=$order_id?>" class="edit">Подтвердить заказ</a> |
<?php endif; ?> 
<a href="?view=orders&amp;del_order=<?=$order_id?>" class="del">Удалить заказ</a>
</p>
<br />

<table class="tabl" cellpadding="1">
    <tr>
        <th class="number">№</th>
        <th class="str_name" style="width: 280px;">Название товара</th>
        <th class="str_sort">Цена</th>
        <th class="str_action">Количество</th>
    </tr>
<?php $i = 1; $total_sum = 0; ?>
<?php foreach($show_order as $item): ?>
    <tr>
        <td><?=$i?></td>
        <td class="name_page"><?=$item['name']?></td>
        <td><?=$item['price']?></td>
        <td><?=$item['qantity']?></td>
    </tr>
<?php $i++; $total_sum += $item['price'] * $item['qantity']; ?>
<?php endforeach; ?>
</table>

<h2>Общая цена заказа: <span style="color: #e35a0f;"><?=$total_sum?></span></h2>
<h2>Дата заказа: <span style="color: #e35a0f;"><?=$item['date']?></span></h2>
<h2>Спопоб доставки: <span style="color: #e35a0f;"><?=$item['sposob']?></span></h2>

<h2>Данные покупателя:</h2>

    <table class="tabl" cellpadding="1">
        <tr>
            <th class="number" style="width: 140px;">ФИО</th>
            <th class="str_name" style="width: 200px;">Адрес</th>
            <th class="str_sort">Для связи</th>
            <th class="str_action">Примечание</th>
        </tr>
        <tr>
            <td><?=htmlspecialchars($item['customer'])?></td>
            <td class="name"><?=htmlspecialchars($item['address'])?></td>
            <td>Email: <?=htmlspecialchars($item['email'])?><br />Телефон: <?=htmlspecialchars($item['phone'])?></td>
            <td style="text-align: left;"><?=htmlspecialchars($item['prim'])?></td>
        </tr>
    </table>

<p>
<?php if($show_order[0]['status'] == 0): ?>
<a href="?view=orders&amp;confirm=<?=$order_id?>" class="edit">Подтвердить заказ</a> |
<?php endif; ?> 
<a href="?view=orders&amp;del_order=<?=$order_id?>" class="del">Удалить заказ</a>
</p>

<?php else: ?>
<div class="error">Заказа с таким номером не существует</div>
<?php endif; ?>
		</div> <!-- .content -->
	</div> <!-- .content-main -->
</div> <!-- .karkas -->
</body>
</html>