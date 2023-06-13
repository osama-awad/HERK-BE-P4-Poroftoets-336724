<?php

class Home extends BaseController
{
    public function index($id = NULL, $name = NULL)
    {

        $data = [
            'title' => 'Welkom op de homepage',
        ];

        $this->view('Homepage/index', $data);
    }
}