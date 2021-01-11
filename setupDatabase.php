<?php
    // Import config.php file
    require_once('config.php');

    // Create connection
    $conn = new mysqli(DB_HOST, DB_USER, DB_PWD, DB_NAME);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }else{
        echo "Connection to database!"."</br>";

        // Get data from csv file    
        $file = fopen("database.csv", "r");
        
        $i = 0;

        $result = array();
        
        while(! feof($file))
        { 
            $row = fgetcsv($file);

            if($i != 0){

                if(isset($row[0])){
                    $row_arr = explode(';', $row[0]);

                    $attributes = $row_arr[1];
                    $table = $row_arr[2];
                    $attribute_type = $row_arr[3];
                    $length = $row_arr[4];
                    $option = $row_arr[5];
                    $default = $row_arr[6];                 

                    $result[$table][$attributes] = array(
                        'attribute_type' => $attribute_type,
                        'length' => $length,
                        'option' => $option,
                        'default' => $default
                    );                    
                }

            }
            
            $i++;
        }

        foreach($result as $key => $val){
            $sql= 'CREATE TABLE '.$key.' (';
            foreach ($val as $keys => $value) {
                $sql .= $keys.' '.$value['attribute_type'];
                if($value['length']) {
                    $sql .= '('.$value['length'].')';
                }

                if($value['option'] == 'PrimaryKey') {
                    $sql .= ' PRIMARY KEY';
                }
                if($value['option'] == 'NotNull') {
                    $sql .= ' NOT NULL';
                }
                
                $sql .= ', ';               
            }            
            
            //The line below gets rid of the comma
            $sql = substr($sql,0,strlen($sql)-2);
            $sql .= ')';

            $conn->query($sql);
        }

        $conn->close();

        print_r($result);
        
        fclose($file);
    }    
?>