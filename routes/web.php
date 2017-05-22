<?php

Route::get('/', function () {
    return view('welcome');
});
Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

Route::get('register/success', 'Auth\RegisterController@verifyEmailFirst')->name('register.success');
Route::get('verify/{email}/{verifyToken}', 'Auth\RegisterController@sendEmailDone')->name('sendEmailDone');
Route::post('login/notrobot', 'Auth\RegisterController@notrobot')->name('login/notrobot');

Route::prefix('admin')->group(function () {
    Route::get('/', 'Admin\LoginController@showLoginForm')->name('admin.login');
    Route::post('/', 'Admin\LoginController@login')->name('admin.login.submit');
    Route::post('/logout', 'Admin\LoginController@logout')->name('admin.logout');
    Route::post('admin-password/email', 'Admin\ForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
    Route::get('admin-password/reset', 'Admin\ForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
    Route::post('admin-password/reset', 'Admin\ResetPasswordController@reset');
    Route::get('admin-password/reset/{token}', 'Admin\ResetPasswordController@showResetForm')->name('admin.password.reset');
    Route::post('/register', 'Admin\RegisterController@register');
    Route::get('/register', 'Admin\RegisterController@showRegistrationForm')->name('admin.register');
    Route::get('/dashboard', 'AdminController@index')->name('admin.dashboard');
    Route::get('/dashboardv2', 'AdminController@index2')->name('admin.dashboard');
});

// Socialite login
Route::get('auth/{provider}', 'Auth\RegisterController@redirectToProvider');
Route::get('auth/{provider}/callback', 'Auth\RegisterController@handleProviderCallback');

Route::prefix('ez')->group(function () {
    Route::get('/', 'EzController@index')->name('ez');
    Route::get('/member/{user}/edit', 'EditController@showEditForm');
    Route::put('/member/{user}', 'EditController@update');
    Route::post('/contact', 'EzController@contact');
    Route::get('/{location}/location', 'EzController@location');
});

Route::prefix('ez/tour')->group(function () {
    Route::get('/', 'EzController@showtour');
    Route::get('/{tour}/detail', 'EzController@showtourdetail');
    Route::get('/{tour}/form', 'EzController@showTourForm');
    Route::get('/review', 'EzController@showReviewTourForm');
    Route::get('/payment', 'EzController@showPaymentTourForm');
    Route::post('/tours', 'EzController@tourstore');
    Route::get('/process', 'EzController@showProcessTourForm');
    Route::get('/{tourform}/e-ticket', 'EzController@eticket');
    Route::get('/{tourform}/print', 'EzController@printTicketTour');
});

Route::prefix('ez/travel')->group(function () {
    Route::get('/', 'EzController@showTravel');
    Route::get('/{travel}/form', 'EzController@showTravelForm');
    Route::get('/review', 'EzController@showReviewTravelForm');
    Route::get('/payment', 'EzController@showPaymentTravelForm');
    Route::post('/travels', 'EzController@travelstore');
    Route::get('/process', 'EzController@showProcessTravelForm');
    Route::get('/{travelform}/e-ticket', 'EzController@eticketTravel');
    Route::get('/{travelform}/print', 'EzController@printTicketTravel');
});

/*Route::group(['middleware' => 'auth'], function () {

});*/