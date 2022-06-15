<?php

class Database
{
    private $host = '127.0.0.1';
    private $user = 'root';
    private $pass = '';
    private $dbname = 'otp-form';
    private $port = '3306';
    private $charset = 'utf8';

    private $dbh;
    private $error;

    public function __construct()
    {
        $this->connect();
    }

    public function connect()
    {
        // Set DSN
        $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->dbname.';port='.$this->port.';charset='.$this->charset;
        // Set options
        $options = [
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        ];
        // Create a new PDO instanace
        try {
            $this->dbh = new PDO($dsn, $this->user, $this->pass, $options);

        } catch (PDOException $e) {
            // Catch any errors
            $this->error = $e->getMessage();
        }
    }

    public function query($query) {
        $this->stmt = $this->dbh->prepare($query);
    }

    public function bind($param, $value, $type = null) {
        if (is_null($type)) {
            switch (true) {
                case is_int($value):
                    $type = PDO::PARAM_INT;
                    break;
                case is_bool($value):
                    $type = PDO::PARAM_BOOL;
                    break;
                case is_null($value):
                    $type = PDO::PARAM_NULL;
                    break;
                default:
                    $type = PDO::PARAM_STR;
            }
        }
        $this->stmt->bindValue($param, $value, $type);
    }

    public function execute() {
        return $this->stmt->execute();
    }

    public function resultset() {
        $this->execute();
        return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getOne() {
        $this->execute();
        return $this->stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function rowCount() {
        return $this->stmt->rowCount();
    }

    public function lastInsertId() {
        return $this->dbh->lastInsertId();
    }

    public function write($query,$data = array()){

        $con = $this->dbh;

        $stm = $con->prepare($query);
        $result = $stm->execute($data);

        if($result){
            return true;
        }else{
            return false;
        }
    }

    public function read($query,$data = array()){

        $con = $this->dbh;

        $stm = $con->prepare($query);
        $result = $stm->execute($data);

        if($result){

            $data = $stm->fetchAll(PDO::FETCH_ASSOC);
            if(is_array($data) && count($data) > 0){
                return $data;
            }
        }

        return false;
    }


}
