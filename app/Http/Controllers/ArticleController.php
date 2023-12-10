<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\ArticleReq;
use App\Http\Repositories\ArticleRepository;
use App\Models\Article;


class ArticleController extends BaseController
{
    public function saveArticle(ArticleReq $request)
    {
        $article = new Article;

        if(Auth::check()) {
            $article->title = $request->input('title');
            $article->link = $request->input('link');
            $article->content = $request->input('content');
            $article->company = $request->input('company');
            $article->image = 'sample image';
            $article->status = 0;
            $article->date = now();
            $article->writer = Auth::User()->id;
            $article->editor = Auth::User()->id;
            $article->save();
        }

        return ['isLogin' => false];
    }

    public function getArticles()
    {
        if(Auth::check()) {
            $article = new ArticleRepository;
            $id = Auth::User()->id;
            return $article->getArticles($id);
        }
        return ['isLogin' => false];
    }
}
