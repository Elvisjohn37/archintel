<?php

namespace App\Http\Repositories;

use App\Models\Article;

class ArticleRepository extends BaseRepository
{

	public function getArticles($id)
	{
		$articles = Article::select(
			'article.image', 
			'article.title', 
			'article.link', 
			'article.date',
			'article.content',
			'article.status',
			'article.writer',
			'article.editor',
			'article.company',
			'user.firstname',
			'user.lastname',
		)
		->join('user', 'user.id', 'article.editor')
		->where('article.editor', $id)
		->get();

		return $articles->toArray();
	}

}
