import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.ActivityMonitor;
import Toybox.Time.Gregorian;

class CPT265_WatchFaceView extends WatchUi.WatchFace {
  //FONTS
    private var timeFont;
    private var dataFont;
    private var dateFont;

//ICONS OR IMAGES
    private var stepsIcon;
    private var heartIcon;
    private var backgroundImg;
    private var weatherIcon;

    private var clearIcon;
    private var cloudyIcon;
    private var rainIcon;
    private var partlycloudyIcon;
    private var thunderstormIcon;
    private var snowIcon;
    private var fogIcon;
    private var widnyIcon;
    private var hailIcon;
    private var sandstormIcon;
    private var volcanicashIcon;

    function initialize() {
        WatchFace.initialize();
        timeFont = Application.loadResource(Rez.Fonts.TimeFont);
        dataFont = Application.loadResource(Rez.Fonts.DataFont);
        dateFont = Application.loadResource(Rez.Fonts.DateFont);
        stepsIcon = Application.loadResource(Rez.Drawables.StepsIcon);
        heartIcon = Application.loadResource(Rez.Drawables.HeartIcon);
        backgroundImg = Application.loadResource(Rez.Drawables.Background);

        clearIcon = Application.loadResource(Rez.Drawables.ClearIcon);
        cloudyIcon = Application.loadResource(Rez.Drawables.CloudyIcon);;
        rainIcon = Application.loadResource(Rez.Drawables.RainIcon);
        partlycloudyIcon = Application.loadResource(Rez.Drawables.PartlyCloudyIcon);
        thunderstormIcon = Application.loadResource(Rez.Drawables.ThunderstormsIcon);
        snowIcon = Application.loadResource(Rez.Drawables.SnowIcon);
        fogIcon = Application.loadResource(Rez.Drawables.FogIcon);
        widnyIcon = Application.loadResource(Rez.Drawables.WindyIcon);
        hailIcon = Application.loadResource(Rez.Drawables.HailIcon);
        sandstormIcon = Application.loadResource(Rez.Drawables.SandstormIcon);
        volcanicashIcon = Application.loadResource(Rez.Drawables.VolcanicAshIcon);
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void {
    }

    function onUpdate(dc) {
      View.onUpdate(dc);
      drawBackground(dc);
      drawTime(dc);
      drawNoon(dc);
      drawHR(dc);
      drawSteps(dc);
      drawDate(dc);
      drawBattery(dc);
      drawCalorie(dc);
      drawWeather(dc);
      drawWeatherIcon(dc);
      
    }

    //WEATHER TEXT WITH TEMP AND TYPE
    function drawWeather(dc){
      var weather = getWeatherString();

      dc.drawText(
        (dc.getWidth() / 2),
        80,
        Graphics.FONT_XTINY,
        weather,
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER 
      ); 

    }

    function getWeatherString() as String {
    if (!(Toybox has : Weather)) {
        return "Weather not supported";
    }
    
    var weatherData = Weather.getCurrentConditions();
    var tempC = weatherData.temperature;
    var tempF = (tempC * 9 / 5) + 32;
    var condition = weatherData.condition;
    var conditionString = "Unknown";

    // Map numeric condition values to readable strings
    switch (condition) {
        case Weather.CONDITION_CLEAR:
            conditionString = "Clear";
            break;
        case Weather.CONDITION_PARTLY_CLOUDY:
            conditionString = "Partly Cloudy";
            break;
        case Weather.CONDITION_MOSTLY_CLOUDY:
            conditionString = "Mostly Cloudy";
            break;
        case Weather.CONDITION_RAIN:
            conditionString = "Rain";
            break;
        case Weather.CONDITION_SNOW:
            conditionString = "Snow";
            break;
        case Weather.CONDITION_WINDY:
            conditionString = "Windy";
            break;
        case Weather.CONDITION_THUNDERSTORMS:
            conditionString = "Thunderstorms";
            break;
        case Weather.CONDITION_WINTRY_MIX:
            conditionString = "Wintry Mix";
            break;
        case Weather.CONDITION_FOG:
            conditionString = "Fog";
            break;
        case Weather.CONDITION_HAZY:
            conditionString = "Hazy";
            break;
        case Weather.CONDITION_HAIL:
            conditionString = "Hail";
            break;
        case Weather.CONDITION_SCATTERED_SHOWERS:
            conditionString = "Scattered Showers";
            break;
        case Weather.CONDITION_SCATTERED_THUNDERSTORMS:
            conditionString = "Scattered Thunderstorms";
            break;
        case Weather.CONDITION_UNKNOWN_PRECIPITATION:
            conditionString = "Unknown Precipitation";
            break;
        case Weather.CONDITION_LIGHT_RAIN:
            conditionString = "Light Rain";
            break;
        case Weather.CONDITION_HEAVY_RAIN:
            conditionString = "Heavy Rain";
            break;
        case Weather.CONDITION_LIGHT_SNOW:
            conditionString = "Light Snow";
            break;
        case Weather.CONDITION_HEAVY_SNOW:
            conditionString = "Heavy Snow";
            break;
        case Weather.CONDITION_LIGHT_RAIN_SNOW:
            conditionString = "Light Rain Snow";
            break;
        case Weather.CONDITION_HEAVY_RAIN_SNOW:
            conditionString = "Heavy Rain Snow";
            break;
        case Weather.CONDITION_CLOUDY:
            conditionString = "Cloudy";
            break;
        case Weather.CONDITION_RAIN_SNOW:
            conditionString = "Rain Snow";
            break;
        case Weather.CONDITION_PARTLY_CLEAR:
            conditionString = "Partly Clear";
            break;
        case Weather.CONDITION_MOSTLY_CLEAR:
            conditionString = "Mostly Clear";
            break;
        case Weather.CONDITION_LIGHT_SHOWERS:
            conditionString = "Light Showers";
            break;
        case Weather.CONDITION_SHOWERS:
            conditionString = "Showers";
            break;
        case Weather.CONDITION_HEAVY_SHOWERS:
            conditionString = "Heavy Showers";
            break;
        case Weather.CONDITION_CHANCE_OF_SHOWERS:
            conditionString = "Chance of Showers";
            break;
        case Weather.CONDITION_CHANCE_OF_THUNDERSTORMS:
            conditionString = "Chance of Thunderstorms";
            break;
        case Weather.CONDITION_MIST:
            conditionString = "Mist";
            break;
        case Weather.CONDITION_DUST:
            conditionString = "Dust";
            break;
        case Weather.CONDITION_DRIZZLE:
            conditionString = "Drizzle";
            break;
        case Weather.CONDITION_TORNADO:
            conditionString = "Tornado";
            break;
        case Weather.CONDITION_SMOKE:
            conditionString = "Smoke";
            break;
        case Weather.CONDITION_ICE:
            conditionString = "Ice";
            break;
        case Weather.CONDITION_SAND:
            conditionString = "Sand";
            break;
        case Weather.CONDITION_SQUALL:
            conditionString = "Squall";
            break;
        case Weather.CONDITION_SANDSTORM:
            conditionString = "Sandstorm";
            break;
        case Weather.CONDITION_VOLCANIC_ASH:
            conditionString = "Volcanic Ash";
            break;
        case Weather.CONDITION_HAZE:
            conditionString = "Haze";
            break;
        case Weather.CONDITION_FAIR:
            conditionString = "Fair";
            break;
        case Weather.CONDITION_HURRICANE:
            conditionString = "Hurricane";
            break;
        case Weather.CONDITION_TROPICAL_STORM:
            conditionString = "Tropical Storm";
            break;
        case Weather.CONDITION_CHANCE_OF_SNOW:
            conditionString = "Chance of Snow";
            break;
        case Weather.CONDITION_CHANCE_OF_RAIN_SNOW:
            conditionString = "Chance of Rain Snow";
            break;
        case Weather.CONDITION_CLOUDY_CHANCE_OF_RAIN:
            conditionString = "Cloudy Chance of Rain";
            break;
        case Weather.CONDITION_CLOUDY_CHANCE_OF_SNOW:
            conditionString = "Cloudy Chance of Snow";
            break;
        case Weather.CONDITION_CLOUDY_CHANCE_OF_RAIN_SNOW:
            conditionString = "Cloudy Chance of Rain Snow";
            break;
        case Weather.CONDITION_FLURRIES:
            conditionString = "Flurries";
            break;
        case Weather.CONDITION_FREEZING_RAIN:
            conditionString = "Freezing Rain";
            break;
        case Weather.CONDITION_SLEET:
            conditionString = "Sleet";
            break;
        case Weather.CONDITION_ICE_SNOW:
            conditionString = "Ice Snow";
            break;
        case Weather.CONDITION_THIN_CLOUDS:
            conditionString = "Thin Clouds";
            break;
        case Weather.CONDITION_UNKNOWN:
        default:
            conditionString = "Unknown";
            break;
    }

      return tempF.format("%d") + "F " + conditionString;
    }   

//CALORIES BURN
    function drawCalorie(dc){
      var calorie = getCaloriesString();
      var dataWidth = dc.getTextWidthInPixels(calorie, dataFont) + 40;
      var x = dc.getWidth() / 2 - dataWidth / 2;

      dc.drawText(
        x + 82,
        dc.getHeight() -58,
        Graphics.FONT_XTINY,
        calorie,
        Graphics.TEXT_JUSTIFY_LEFT
      );



    }
    function getCalories() as Number {
        var info = ActivityMonitor.getInfo();

        var calories;

        if(info != null) {
            calories = info[:calories];
        }
        else {
            calories = 0;
        }

        return calories;
    }

    function getCaloriesString() as String {
        return getCalories().format("%d");
    }

//BATTERY
    function drawBattery(dc){
      var battery = "";

      battery = (getBatteryString());
      dc.drawText(
        (dc.getWidth() / 2)+ 40,
        18,
        Graphics.FONT_TINY,
        battery,
        Graphics.TEXT_JUSTIFY_RIGHT
      );  
    }

    function getBattery() as Float {
        return Toybox.System.getSystemStats().battery;
    }

    function getBatteryString() as String {
        return getBattery().format("%d") + "%";
    }

//AM AND PM ADDED
    function drawNoon(dc){
      var clockTime = System.getClockTime();
      var hour = clockTime.hour;
      var noon1 = "";
      var noon2 = "";
      var day = true;
      if (hour > 12) {
        day = false;
        hour -= 12;
      }

      if(day){
        noon1 = "A";
        noon2 = "M";
      }
      else{
        noon1 = "P";
        noon2 = "M";
      }
      dc.drawText(
        (dc.getWidth() / 2) + 112,
        99,
        Graphics.FONT_SMALL,
        noon1,
        Graphics.TEXT_JUSTIFY_RIGHT 
      );
      dc.drawText(
        (dc.getWidth() / 2) + 115,
        120,
        Graphics.FONT_SMALL,
        noon2,
        Graphics.TEXT_JUSTIFY_RIGHT 
      );   
      

    }
//TIME 
    function drawTime(dc) {
      var clockTime = System.getClockTime();
      var hour = clockTime.hour;
      
   
      if (hour > 12) {

        hour -= 12;
      }
      var timeString = Lang.format("$1$:$2$", [hour, clockTime.min.format("%02d")]);
      

      dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

      dc.drawText(
        dc.getWidth() / 2,
        120,
        Graphics.FONT_SYSTEM_NUMBER_HOT,
        timeString,
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER 
      );      
    }


//HEART RATE
    function drawHR(dc) {
      
      var heartRate = retrieveHeartrateText();

      var dataWidth = dc.getTextWidthInPixels(heartRate, dataFont) + 40;
      var x = dc.getWidth() / 2 - dataWidth / 2;

      dc.drawText(
        x - 22,
        200,
        Graphics.FONT_XTINY,
        heartRate,
        Graphics.TEXT_JUSTIFY_LEFT
      );
    }

    private function retrieveHeartrateText() {
      var heartRateLabel = "";
      heartRateLabel = (getHeartRateString());
      
      return heartRateLabel;
    }

    function getHeartRate() as Number {
        var HeartRateIterator = Toybox.ActivityMonitor.getHeartRateHistory(1, true);
        return HeartRateIterator.next().heartRate;
    }

    function getHeartRateString() as String {
        return getHeartRate().format("%d");
    }


//BACKGROUND IMAGE
    function drawBackground(dc){
      var x = dc.getWidth();

      dc.drawBitmap(
        x - 280,
        dc.getHeight() -280,
        backgroundImg
      );
    }

//STEPS
    function drawSteps(dc) {
      var stepCount = StepsToString();
      var dataWidth = dc.getTextWidthInPixels(stepCount, dataFont) + 40;
      var x = dc.getWidth() / 2 - dataWidth / 2;

      dc.drawText(
        x + 30,
        dc.getHeight() -58,
        Graphics.FONT_XTINY,
        stepCount,
        Graphics.TEXT_JUSTIFY_LEFT
      );
    }
    function Steps() as Number or Null {
        return Toybox.ActivityMonitor.getInfo().steps;
    }

    function StepsToString() as String {
        var steps = Steps();
        return steps == null ? "-" : Steps().format("%d");
    }


//DATE
    function drawDate(dc) {
      var now = Time.now();
      var date = Gregorian.info(now, Time.FORMAT_MEDIUM);
      var dateString = Lang.format("$1$, $2$ $3$", [date.day_of_week, date.month, date.day]);

      dc.drawText(
        dc.getWidth() / 2,
        152,
        dateFont,
        dateString,
        Graphics.TEXT_JUSTIFY_CENTER
      );
    }



    //Retrieves weather icon based on weather condition
    function getWeatherDrawable() as String {
    if (!(Toybox has : Weather)) {
        return "weather_unknown"; // Default icon if Weather API is not available
    }

    var weatherData = Weather.getCurrentConditions();
    var condition = weatherData.condition;
    var conditionIcon;

    // Map weather conditions to drawable resource names
     switch (condition) {
        // Clear & Fair Conditions
        case Weather.CONDITION_CLEAR:
        case Weather.CONDITION_FAIR:
            conditionIcon = clearIcon;
            break;

        // Partly Cloudy Conditions
        case Weather.CONDITION_PARTLY_CLOUDY:
        case Weather.CONDITION_PARTLY_CLEAR:
        case Weather.CONDITION_MOSTLY_CLEAR:
            conditionIcon = partlycloudyIcon;
            break;

        // Cloudy Conditions
        case Weather.CONDITION_CLOUDY:
        case Weather.CONDITION_THIN_CLOUDS:
        case Weather.CONDITION_MOSTLY_CLOUDY:
            conditionIcon = cloudyIcon;
            break;

        // Rain & Showers
        case Weather.CONDITION_RAIN:
        case Weather.CONDITION_LIGHT_RAIN:
        case Weather.CONDITION_HEAVY_RAIN:
        case Weather.CONDITION_SHOWERS:
        case Weather.CONDITION_LIGHT_SHOWERS:
        case Weather.CONDITION_HEAVY_SHOWERS:
        case Weather.CONDITION_SCATTERED_SHOWERS:
        case Weather.CONDITION_CLOUDY_CHANCE_OF_RAIN:
        case Weather.CONDITION_CHANCE_OF_SHOWERS:
            conditionIcon = rainIcon;
            break;

        // Thunderstorms
        case Weather.CONDITION_THUNDERSTORMS:
        case Weather.CONDITION_SCATTERED_THUNDERSTORMS:
        case Weather.CONDITION_CHANCE_OF_THUNDERSTORMS:
            conditionIcon = thunderstormIcon;
            break;

        // Snow & Ice
        case Weather.CONDITION_SNOW:
        case Weather.CONDITION_LIGHT_SNOW:
        case Weather.CONDITION_HEAVY_SNOW:
        case Weather.CONDITION_RAIN_SNOW:
        case Weather.CONDITION_LIGHT_RAIN_SNOW:
        case Weather.CONDITION_HEAVY_RAIN_SNOW:
        case Weather.CONDITION_FLURRIES:
        case Weather.CONDITION_WINTRY_MIX:
        case Weather.CONDITION_ICE_SNOW:
        case Weather.CONDITION_SLEET:
        case Weather.CONDITION_FREEZING_RAIN:
        case Weather.CONDITION_CLOUDY_CHANCE_OF_SNOW:
        case Weather.CONDITION_CLOUDY_CHANCE_OF_RAIN_SNOW:
        case Weather.CONDITION_CHANCE_OF_SNOW:
        case Weather.CONDITION_CHANCE_OF_RAIN_SNOW:
            conditionIcon = snowIcon;
            break;

        // Fog & Mist
        case Weather.CONDITION_FOG:
        case Weather.CONDITION_MIST:
        case Weather.CONDITION_HAZE:
        case Weather.CONDITION_HAZY:
        case Weather.CONDITION_SMOKE:
            conditionIcon = fogIcon;
            break;

        // Wind & Storms
        case Weather.CONDITION_WINDY:
        case Weather.CONDITION_SQUALL:
        case Weather.CONDITION_HURRICANE:
        case Weather.CONDITION_TROPICAL_STORM:
        case Weather.CONDITION_TORNADO:
            conditionIcon = widnyIcon;
            break;

        // Hail & Ice
        case Weather.CONDITION_HAIL:
        case Weather.CONDITION_ICE:
        case Weather.CONDITION_FREEZING_RAIN:
            conditionIcon = hailIcon;
            break;

        // Sand & Dust Storms
        case Weather.CONDITION_SAND:
        case Weather.CONDITION_SANDSTORM:
        case Weather.CONDITION_DUST:
            conditionIcon = sandstormIcon;
            break;

        // Volcanic Ash
        case Weather.CONDITION_VOLCANIC_ASH:
            conditionIcon = volcanicashIcon;
            break;

        // Default to Clear if Unknown
        case Weather.CONDITION_UNKNOWN:
        default:
            conditionIcon = clearIcon;
            break;
    }

    return conditionIcon;

}  
    function updateWeatherIcon() {
        var condition = getWeatherDrawable();
        
        
        if (condition == "clear") {
            weatherIcon = clearIcon;
        } 
        else if (condition == "cloudy") {
            weatherIcon = cloudyIcon;
        }
        else if (condition == "rain") {
            weatherIcon = rainIcon;
        } 
        else if (condition == "partly_cloudy") {
            weatherIcon = partlycloudyIcon;
        }
        else if (condition == "thunderstorms") {
            weatherIcon = thunderstormIcon;
        }
        else if (condition == "snow") {
            weatherIcon = snowIcon;
        }
        else if (condition == "fog") {
            weatherIcon = fogIcon;
        }
        else if (condition == "windy") {
            weatherIcon = widnyIcon;
        }
        else if (condition == "hail") {
            weatherIcon = hailIcon;
        }
        else if (condition == "sandstorm") {
            weatherIcon = sandstormIcon;
        }
        else if (condition == "volcanic_ash") {
            weatherIcon = volcanicashIcon;
        }
    }

    //WEATHER ICON
    function drawWeatherIcon(dc) {
    // updateWeatherIcon(); // Ensure we have the right icon before drawing

    var icon = getWeatherDrawable();
    
    //   dc.drawBitmap(
    //     40,
    //     55,
    //     icon
    //   ); 
    dc.drawBitmap(
        5,
        105,
        icon
      ); 

}





    function onHide() as Void {
    }

    function onExitSleep() as Void {
    }

    function onEnterSleep() as Void {
    }

}
