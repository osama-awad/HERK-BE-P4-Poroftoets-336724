<?php

class DataBase
{
    private $dbHost = DB_HOST;
    private $dbUser = USERNAME;
    private $dbPass = DB_PASS;
    private $dbName = DB_NAME;
    private $dbHandler;
    private $statment;


    public function  __construct()
    {
        // Verbinding met de database maken

        $conn = 'mysql:host=' . $this->dbHost . ';dbname=' . $this->dbName . ';charset=UTF8';

        try {
            $this->dbHandler = new PDO($conn, $this->dbUser, $this->dbPass);
            // echo "connnected";
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

    public function query($sql)
    {
        $this->statment = $this->dbHandler->prepare($sql);
    }

    public function excute()
    {
        return $this->statment->execute();
    }

    public function resultSet()
    {
        $this->excute();
        return $this->statment->fetchAll(PDO::FETCH_OBJ);
    }
}
