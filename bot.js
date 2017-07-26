console.log("Weather Bot activated.");

var Twit = require('twit');
var fs = require('fs');

var weather = require('weather-js');
var we;


var config = require('./config');
var promt = require('prompt');

//console.log(config);
promt.start();

var T = new Twit(config);
//var stream = T.stream('user');
var tw;
var inp;

var numSunny = 0;
var numRain = 0;
var numCloudy = 0;
var numStorm = 0;
var numHot = 0;
var numCold = 0;

const exec = require('child_process').exec;

function params (weather, num){
var params = {
    q: weather,
    count: numPPP
}
return params;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
promt.get(['Search'],function(err,result){
    console.log('OK');
    console.log('Search for: '+result.Search);
    inp=result.Search;
    T.get('search/tweets',params(result.Search,10),gotData);
});
*/

weather.find({search: 'Hebden Bridge', degreeType: 'F'}, function(err, result) {
  if(err) console.log(err);
 
  console.log(JSON.stringify(result, null, 2));
  //we = result.name;
  console.log(result);
});




//tweetIt();
//setInterval(tweetIt,1000*20);


////////////////////////////////////////////////////////////////////////////////////////////////////////

function tweetIt(){
//'T.get('search/tweets',params(inp,10),gotData);


//const cmd = 'C:\\Users\\Jim\\Documents\\processing-3.3.3\\processing-java --sketch=C:\\node\\javascripting\\Blueimage --run';
const cmd = 'C:\\Users\\Jim\\Documents\\processing-3.3.3\\processing-java --sketch=C:\\node\\javascripting\\Light_Screen_Emulation --run';

exec(cmd,processing);

function processing(error, stdout, stderr){
     var filename = 'Light_Screen_Emulation/output.png';
     var params = {
         encoding: 'base64'
     }
     var b64 = fs.readFileSync(filename,params);
    T.post('media/upload',{media_data: b64},uploaded);

     function uploaded(err, data, responce){
         var id = data.media_id_string;
         var tweet = {
             // switch stament here??
            status: '#Lights .. Example for Dave',
         
             media_ids: [id]
         } 
          T.post('statuses/update', tweet, tweeted);
     }

     }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function tweeted(err,data,responce){
    if(err){
        console.log("Somthing went wrong!!");
    }else{
        console.log("Tweet Sent OK");
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function gotData(err,data,responce){
    var tweets = data.statuses;
    for(var i=0;i<tweets.length;i++){
        console.log(tweets[i].text);
    }
    tw = tweets[1].text;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////



//stream.on('follow',followed);
/*
function followed(eventMsg){
    var name = eventMsg.source.name;
    var screenName = eventMsg.source.screen_name;
    tweetIt();
} 

*/





/*






*/