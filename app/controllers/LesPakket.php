<?php
class LesPakket extends BaseController
{
    private $LesPakket;

    function __construct()
    {
        $this->LesPakket = $this->model('LesPakketModel');
    }
    function index()
    {
        $result = $this->LesPakket->getLesPakket();
        
        $data = [
            'title' => "Overzicht Rijlespakkertten leerlingen",
            'result' => $result
        ];
        
        // var_dump($data);
        $this->view('LesPakket/index',$data);
    }
}