<?php

namespace App\Http\Repositories;

use App\Models\User;

class UserRepository extends BaseRepository
{

	public function getUserData()
	{
		$user = User::select(
			'firstname', 
			'lastname', 
			'type', 
			'status'
		)
		->first();

		return $user->toArray();
	}

}
