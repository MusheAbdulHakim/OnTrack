<?php

class Asset extends App {


    public static function add($data) {
    	global $database;

        $categoryid = 0;
        $manufacturerid = 0;
        $modelid = 0;
        $supplierid = 0;
        $locationid = 0;

        if(isset($data['category'])) {
            $categoryid = $database->get("assetcategories", "id", [ "name" => $data['category'] ]);
            if($categoryid == "") $categoryid = $database->insert("assetcategories", [ "name" => $data['category'], "color" => rand_color() ]);
        }

        if(isset($data['manufacturer'])) {
            $manufacturerid = $database->get("manufacturers", "id", [ "name" => $data['manufacturer'] ]);
            if($manufacturerid == "") $manufacturerid = $database->insert("manufacturers", [ "name" => $data['manufacturer'] ]);
        }

        if(isset($data['model'])) {
            $modelid = $database->get("models", "id", [ "name" => $data['model'] ]);
            if($modelid == "") $modelid = $database->insert("models", [ "name" => $data['model'] ]);
        }

        if(isset($data['supplier'])) {
            $supplierid = $database->get("suppliers", "id", [ "name" => $data['supplier'] ]);
            if($supplierid == "") $supplierid = $database->insert("suppliers", [ "name" => $data['supplier'] ]);
        }

        if(isset($data['location'])) {
            $locationid = $database->get("locations", "id", [ "AND" => [ "name" => $data['location'], "clientid" => $data['clientid'] ] ]);
            if($locationid == "") $locationid = $database->insert("locations", [ "name" => $data['location'], "clientid" => $data['clientid'] ]);
        }

    	$lastid = $database->insert("assets", [
    		"categoryid" => $categoryid,
    		"adminid" => $data['adminid'],
    		"clientid" => $data['clientid'],
    		"userid" => $data['userid'],
            "manufacturerid" => $manufacturerid,
    		"modelid" => $modelid,
    		"supplierid" => $supplierid,
    		"statusid" => $data['statusid'],
    		"purchase_date" => $data['purchase_date'],
    		"warranty_months" => $data['warranty_months'],
    		"tag" => $data['tag'],
    		"name" => $data['name'],
    		"serial" => $data['serial'],
    		"notes" => $data['notes'],
            "locationid" => $locationid,
            "purchase_order" => $data['purchase_order'],
            "value" => $data['value'],
            "condition" => $data['condition'],
            "removal_date" => $data['removal_date']
    	]);
    	if ($lastid == "0") { return "11"; } else { logSystem("Asset Added - ID: " . $lastid); return "10"; }
    	}

    public static function edit($data) {
    	global $database;

        $categoryid = 0;
        $manufacturerid = 0;
        $modelid = 0;
        $supplierid = 0;
        $locationid = 0;

        if(isset($data['category'])) {
            $categoryid = $database->get("assetcategories", "id", [ "name" => $data['category'] ]);
            if($categoryid == "") $categoryid = $database->insert("assetcategories", [ "name" => $data['category'], "color" => rand_color() ]);
        }

        if(isset($data['manufacturer'])) {
            $manufacturerid = $database->get("manufacturers", "id", [ "name" => $data['manufacturer'] ]);
            if($manufacturerid == "") $manufacturerid = $database->insert("manufacturers", [ "name" => $data['manufacturer'] ]);
        }

        if(isset($data['model'])) {
            $modelid = $database->get("models", "id", [ "name" => $data['model'] ]);
            if($modelid == "") $modelid = $database->insert("models", [ "name" => $data['model'] ]);
        }

        if(isset($data['supplier'])) {
            $supplierid = $database->get("suppliers", "id", [ "name" => $data['supplier'] ]);
            if($supplierid == "") $supplierid = $database->insert("suppliers", [ "name" => $data['supplier'] ]);
        }

        if(isset($data['location'])) {
            $locationid = $database->get("locations", "id", [ "AND" => [ "name" => $data['location'], "clientid" => $data['clientid'] ] ]);
            if($locationid == "") $locationid = $database->insert("locations", [ "name" => $data['location'], "clientid" => $data['clientid'] ]);
        }

    	$database->update("assets", [
            "categoryid" => $categoryid,
    		"adminid" => $data['adminid'],
    		"clientid" => $data['clientid'],
    		"userid" => $data['userid'],
            "manufacturerid" => $manufacturerid,
    		"modelid" => $modelid,
    		"supplierid" => $supplierid,
    		"statusid" => $data['statusid'],
    		"purchase_date" => $data['purchase_date'],
    		"warranty_months" => $data['warranty_months'],
    		"tag" => $data['tag'],
    		"name" => $data['name'],
    		"serial" => $data['serial'],
    		"notes" => $data['notes'],
            "locationid" => $locationid,
            "purchase_order" => $data['purchase_order'],
            "value" => $data['value'],
            "condition" => $data['condition'],
            "removal_date" => $data['removal_date']
    	], [ "id" => $data['id'] ]);
    	logSystem("Asset Edited - ID: " . $data['id']);
    	return "20";
    	}

    public static function delete($id) {
    	global $database;
        $database->delete("assets", [ "id" => $id ]);
    	logSystem("Asset Deleted - ID: " . $id);
    	return "30";
    	}

    public static function nextAssetTag() {
    	global $database;
        $max = $database->max("assets", "id");
    	return $max+1;
    	}


    public static function assignLicense($data) { //assign license to asset
    	global $database;
    	$lastid = $database->insert("licenses_assets", [
    		"licenseid" => $data['licenseid'],
    		"assetid" => $data['assetid']
    	]);
    	if ($lastid == "0") { return "11"; } else { return "10"; }
    }

    public static function unassignLicense($id) { //unassign license to asset
    	global $database;
        $database->delete("licenses_assets", [ "id" => $id ]);
    	return "30";
    }
}


?>
