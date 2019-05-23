<?php
Route::group(['middleware' => ['guest'], 'prefix' => 'auth'], function () {
    Route::post('register', 'AuthController@register');
    Route::post('login', 'AuthController@login');
    Route::get('logout', 'AuthController@logout');
});

Route::group(['middleware' => 'auth.api'], function () {
    Route::get('user', 'AuthController@user');
    Route::resource('todo', 'TodoController');
});
