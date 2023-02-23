#include <FirebaseESP8266.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include <Wire.h>
#include <NTPClient.h>
#include <WiFiUdp.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#define RESTRICT_PITCH


Adafruit_MPU6050 mpu;

//firebase configuration
#define FIREBASE_HOST "http-demo-17845-default-rtdb.firebaseio.com/gy521.json"
#define FIREBASE_AUTH "TKl2ib4mYJRUOC6c0iyLzNah8qwu369ewx8wW5jM"
FirebaseData firebaseData;
FirebaseJsonArray arr;
FirebaseJson json;

//MPU pitch and roll variables
String pitch;
String roll;



//ultra sonic
const int trigPin = 12;
const int echoPin = 14;

//bites variables
int noBites = 0;
int oldNoBites = 0;
int noTimes = 0; // counter to the times the ultrasonic signal sees the hand
String noBitesSTR;// the number of bites fetched from firebase
bool check = false;

//fall detection variables
bool fall_flag = 0;
bool old_fall_flag = 0;


// defines variables
long duration; // variable for the duration of sound wave travel
int distance; // variable for the distance measurement
unsigned long curr = 0;
unsigned long prev = 0;
unsigned long timerr = 0, timerr1 = 0;


//key for the backend
String keyDate;

//Define NTP Client to get time
WiFiUDP ntpUDP;
String daysOfTheMonth[31] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"};
String months[12] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
NTPClient timeClient(ntpUDP, "pool.ntp.org");


//wifi configuration
const String ssid = "Galaxy S9 Plus";
const String password = "tralaw987";

//Timer set to 10 seconds (10000)
unsigned long timerDelay = 10000;
unsigned long timerfallDelay = 50000;

//For a final application, check the API call limits per hourminute to avoid getting blockedbanned
unsigned long lastTime = 0;
unsigned long lastTimefall = 0;

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  Serial.println("Connecting");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.print("Connected to WiFi network with IP Address");
  Serial.println(WiFi.localIP());
  Serial.println("Timer set to 10 seconds (timerDelay variable), it will take 10 seconds before publishing the first reading.");
  //Random seed is a number used to initialize a pseudorandom number generator
  randomSeed(analogRead(0));
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);




  //formatting the key
  timeClient.begin();
  timeClient.setTimeOffset(0);
  timeClient.update();
  time_t epochTime = timeClient.getEpochTime();
  //Get a time structure
  struct tm *ptm = gmtime((time_t *)&epochTime);

  int monthDay = ptm->tm_mday;
  char day[2];
  itoa(monthDay, day, 2);
  Serial.print("Month day: ");
  Serial.println(monthDay);

  int currentMonth = ptm->tm_mon + 1;
  Serial.print("Month: ");
  Serial.println(currentMonth);
  String currentMonthName = months[currentMonth - 1];
  Serial.print("Month name: ");
  Serial.println(currentMonthName);

  int currentYear = ptm->tm_year + 1900;
  Serial.print("Year: ");
  Serial.println(currentYear);

  keyDate = "/data/" + daysOfTheMonth[monthDay] + "-" + currentMonthName + "-" + currentYear;
  Serial.println("Key : " + keyDate);


  
  //mpu initialization
  if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) {
      delay(10);
    }
  }
  Serial.println("MPU6050 Found!");

  mpu.setAccelerometerRange(MPU6050_RANGE_8_G);
  Serial.print("Accelerometer range set to: ");
  switch (mpu.getAccelerometerRange()) {
    case MPU6050_RANGE_2_G:
      Serial.println("+-2G");
      break;
    case MPU6050_RANGE_4_G:
      Serial.println("+-4G");
      break;
    case MPU6050_RANGE_8_G:
      Serial.println("+-8G");
      break;
    case MPU6050_RANGE_16_G:
      Serial.println("+-16G");
      break;
  }
  mpu.setGyroRange(MPU6050_RANGE_500_DEG);
  Serial.print("Gyro range set to: ");
  switch (mpu.getGyroRange()) {
    case MPU6050_RANGE_250_DEG:
      Serial.println("+- 250 deg/s");
      break;
    case MPU6050_RANGE_500_DEG:
      Serial.println("+- 500 deg/s");
      break;
    case MPU6050_RANGE_1000_DEG:
      Serial.println("+- 1000 deg/s");
      break;
    case MPU6050_RANGE_2000_DEG:
      Serial.println("+- 2000 deg/s");
      break;
  }

  mpu.setFilterBandwidth(MPU6050_BAND_5_HZ);
  Serial.print("Filter bandwidth set to: ");
  switch (mpu.getFilterBandwidth()) {
    case MPU6050_BAND_260_HZ:
      Serial.println("260 Hz");
      break;
    case MPU6050_BAND_184_HZ:
      Serial.println("184 Hz");
      break;
    case MPU6050_BAND_94_HZ:
      Serial.println("94 Hz");
      break;
    case MPU6050_BAND_44_HZ:
      Serial.println("44 Hz");
      break;
    case MPU6050_BAND_21_HZ:
      Serial.println("21 Hz");
      break;
    case MPU6050_BAND_10_HZ:
      Serial.println("10 Hz");
      break;
    case MPU6050_BAND_5_HZ:
      Serial.println("5 Hz");
      break;
  }

  Serial.println("");




  //ultrasonic
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin, INPUT); // Sets the echoPin as an INPUT



  if (Firebase.getString(firebaseData, keyDate + "/noBites")) {                         // On successful Read operation, function returns 1


    noBitesSTR = firebaseData.stringData();
    Serial.print("old bites num:");
    Serial.println(noBitesSTR);
  } else {
    Serial.println(firebaseData.errorReason());
  }


}


void loop() {

  //ultra sonic
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  // Calculating the distance
  distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)

  timerr1 = 0;
  while (distance < 20 )
  {
    curr = millis();
    timerr1 = timerr1 + curr - prev;


    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    distance = duration * 0.034 / 2;

    prev = curr;

  }
  Serial.println(timerr1);
  if (timerr1 > 1000 && check)
  {
    noTimes++;
    check = false;
  }
  else if (!check)
  {
    check = true;
  }
  noBites = noBitesSTR.toInt() + (noTimes / 2);
  Serial.print("bites: ");
  Serial.println(noBites);

  //mpu
  sensors_event_t a, g;
  mpu.getEvent(&a, &g);

  //fall detection
  Serial.println("----------");
  if ((g.gyro.x * g.gyro.x + g.gyro.y * g.gyro.y + g.gyro.z * g.gyro.z) > 100) {
    Serial.println("fall ");
    fall_flag = 1;
  }
  Serial.print("flag:");
  Serial.println(fall_flag);
  

  
  pitch =  atan(-a.acceleration.x / sqrt(a.acceleration.y * a.acceleration.y + a.acceleration.z * a.acceleration.z)) * RAD_TO_DEG;
  roll  =  atan(a.acceleration.y / sqrt(a.acceleration.x * a.acceleration.x + a.acceleration.z * a.acceleration.z)) * RAD_TO_DEG;



  Serial.println("roll:");
  Serial.println(roll);
  Serial.println("pitch:");
  Serial.println(pitch);



  //Send an HTTP POST request


  if (fall_flag != old_fall_flag) {

    if (WiFi.status() == WL_CONNECTED) {
      if (Firebase.setBool(firebaseData, keyDate + "/fall detection", fall_flag)) {
        Serial.println("uploaded fall detection succesfully");
      }
      else {
        Serial.println(firebaseData.errorReason());
      }
    }
    old_fall_flag = fall_flag;

  }

  if ((millis() - lastTimefall) > timerfallDelay) {
    fall_flag = 0;
    lastTimefall = millis();
  }

  if (noBites != oldNoBites) {
    //Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {

      if (Firebase.setDouble(firebaseData, keyDate + "/noBites", noBites)) {
        Serial.println("uploaded number of bites succesfully");
      }
      else {
        Serial.println(firebaseData.errorReason());
      }
    }
    oldNoBites = noBites;
  }




  if ((millis() - lastTime) > timerDelay) {
    //Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
      //
      if (Firebase.pushString(firebaseData, keyDate + "/pitch", pitch)) {
        Serial.println("uploaded pitch succesfully");
      }
      else {
        Serial.println(firebaseData.errorReason());
      }
      if (Firebase.pushString(firebaseData, keyDate + "/roll", roll)) {
        Serial.println("uploaded roll succesfully");
      }
      else {
        Serial.println(firebaseData.errorReason());
      }

      delay(3000);
    }
    else {
      Serial.println("WiFi Disconnected");
    }
    lastTime = millis();
  }

}
