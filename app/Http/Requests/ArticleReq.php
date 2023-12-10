<?php

namespace App\Http\Requests;

use App\Exceptions\UnauthorizedException;
use Illuminate\Contracts\Validation\Validator;

class ArticleReq extends BaseRequest
{
	/**
	 * reset failedValidation action to original
	 * redirect instead of throw error
	 */
	public function failedValidation(Validator $validator)
	{
		throw new UnauthorizedException('Login parameter invalid');
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array
	 */
	public function rules()
	{
		$datas = [
			'title' => 'required',
			'link' => 'required',
			'company' => 'required',
			'content' => 'required',
		];

		return $this->bailAll($datas);
	}
}
