<?php
 require_once "util.php";

 // 1 - very verbose debug messages
 // 2 - debug messages
 // 3 - info messages
 // 4 - error messages
 $ACELogLevel=4;
 function AceLog($severity,$msg)
 {
    global $ACELogLevel;
    if ($severity>=$ACELogLevel) echo "$msg\n";
 }

 const AS_JSON_URL = "https://search.acestream.net/all?api_version=1.0&api_key=test_api_key";
 const AVAIL_THRESHOLD = (8*86400);

 function AceGetChannelListJson(&$chns,$fname_prev,$chn_exp_time)
 {
   $resp = curl_get_contents(AS_JSON_URL,"okhttp/2.5.0",5000,5000);
   if ($resp["code"]==200)
   {
     $a=json_decode($resp["resp"]);
     if ($a)
     {
       if (count($a)<100)
	 AceLog(4,"too few records in array can be bad");
       else
       {
         $prev = file_exists($fname_prev) ? json_decode(file_get_contents($fname_prev),TRUE) : NULL;
         if (!is_array($prev)) $prev = [];
         $tnow = time();
         $chns = [];
         foreach ($a as $c)
         {
	    $avail = isset($c->availability) ? $c->availability : 0;
	    $upd = $c->availability_updated_at;
	    if ($avail<0.8 || ($tnow-$upd)>AVAIL_THRESHOLD) continue;

	    $cat = (isset($c->categories) && !empty($c->categories) && !empty($c->categories[0])) ? $c->categories[0] : "none";
	    $name = $c->name;
	    if (!array_key_exists($name,$chns) ||
	         array_key_exists($name,$chns) && (($chns[$name]["avail"] < $avail) || ($chns[$name]["avail"] == $avail) && $chns[$name]["upd"] < $upd))
	    {
		$chns[$name] = array('name' => $name, 'avail' => $avail, 'upd' => $upd, 'cat' => $cat, 'infohash' => $c->infohash, "t" => $tnow);
                AceLog(2, "adding search channel \"$name\"");
	    }
	 }
	 foreach ($prev as $c)
	 {
           if (!array_key_exists($c["name"], $chns) && ($tnow-$c["t"])<$chn_exp_time && ($tnow-$c["upd"])<AVAIL_THRESHOLD)
           {
		$chns[$c["name"]] = $c;
                AceLog(2, "adding previous search channel \"".$c["name"]."\"");
           }
	 }
       }
       file_put_contents($fname_prev,json_encode($chns,JSON_UNESCAPED_UNICODE));
       return true;
     }
     else
       AceLog(4,"bad json");
  }
  else
    AceLog(4,"json download failed");
  return false;
}

?>
