<?php

use yii\db\Migration;

/**
 * Class m241029_205648_init
 */
class m241029_205648_init extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
	$this->createTable('users', [
		'id' => $this->primaryKey(),
		'email' => $this->string(255)->notNull()->unique()->comment('Email'),
	]);
	
	$this->createTable('orders', [
		'id' => $this->primaryKey(),
		'user_id' => $this->integer()->notNull()->comment('ID пользователя'),
		'created_at' => $this->dateTime()->notNull()->defaultExpression('CURRENT_TIMESTAMP')->comment('Время заказа'),
		'total_amount' => $this->bigInteger()->notNull()->comment('Сумма в минимальной денежной единице')
	]);
	    
	$this->addForeignKey('users_orders_fk', 'orders', 'user_id', 'users', 'id');
	$this->createIndex('orders_total_amount_index', 'orders', 'total_amount');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
	$this->dropForeignKey('users_orders_fk', 'orders');
        $this->dropTable('orders');
	$this->dropTable('users');
    }

}
