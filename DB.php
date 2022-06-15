<?php
ini_set('display_errors', 1);
/**
 *
 */
class DBconnect
{
    private $host = '127.0.0.1';
    private $user = 'root';
    private $pass = '';
    private $dbname = 'oopdev';
    private $port = '3606';


    private $dbh;
    private $error;
    private $stmt;

    function __construct()
    {
        echo "construct DB<br>";
        $dsn = 'mysql:host='.$this->host.';dbname=' . $this->dbname.';port='.$this->port;
        $options = [
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ];

        try {
            $this->dbh = new PDO($dsn, $this->user, $this->pass, $options);
        } catch (PDOException $e) {
            $this->error = $e->getMessage;
        }
    }

    public function query($query){
        $this->stmt = $this->dbh->prepare($query);
    }

    public function bind($param, $value, $type = null){
        if(is_null($type)){
            switch(true){
                case is_int($value): $type = PDO::PARAM_INT; break;
                case is_bool($value): $type = PDO::PARAM_BOOL; break;
                case is_null($value): $type = PDO::PARAM_BOOL; break;
                default: $type = PDO::PARAM_STR; break;
            }
        }

        $this->stmt->bindValue($param, $value, $type);
    }

    public function execute(){
        return $this->stmt->execute();
    }

    public function resultSet(){
        $this->execute();
        return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
