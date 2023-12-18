#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <WiFi.h>
#include <WebServer.h>
#include "MegunoLink.h"
#include "Filter.h"
#include <ArduinoJson.h>
#include <HTTPClient.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

// Declaration for SSD1306 display connected using I2C
#define OLED_RESET     -1 // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

long FilterWeight = 5;
ExponentialFilter<long> ADCFilter(FilterWeight, 0);

const char* ssid = "Redmi";
const char* password =  "";

WebServer server(80);
void setup()
{
  Serial.begin(9600);

  // initialize the OLED object
  if (!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;); // Don't proceed, loop forever
  }

  // Clear the buffer.
  display.clearDisplay();

  // Display Text
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 28);
  display.println("Iniciando");
  display.display();

  delay(10); // We start by connecting to a WiFi network Serial.println();
  setupWifi();
  server.on("/getData/1", HTTP_POST, handlePostRequest);
  server.on("/showResponse/1", HTTP_POST, showResponse);
  server.begin();

  display.clearDisplay();

  // Display Text
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 28);
  display.println("Bem vindo!");
  display.display();
}

void loop() {
  WiFiClient client;
  server.handleClient();
  getSensorData();
}

float getSensorData() {
  int sensorValue = 0;
  sensorValue = analogRead(34);
  float tension = (sensorValue * (3.3 / 4095.0)) * 1000;
  ADCFilter.Filter(tension);
  Serial.println(ADCFilter.Current());
  return ADCFilter.Current();
}

void setupWifi() {
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.disconnect();
  /* Explicitly set the ESP8266 to be a WiFi-client, otherwise, it by default, would try to act as both a client and an access-point and could cause network-issues with your other WiFi-devices on your WiFi-network. */
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void handlePostRequest() {
  String body = server.arg("plain");
  // Parse JSON data
  
  DynamicJsonDocument jsonDoc(1024);
  DeserializationError error = deserializeJson(jsonDoc, body);
  if (error) {
    server.send(400, "text/plain", "Invalid JSON");
    return;
  }
  const char *userId = jsonDoc["userId"];
  Serial.println(userId);
  
  // Process the incoming data (body) here
  float finalValue = getSensorData();
  server.send(200, "text/plain", String(finalValue));
}

void showResponse(){
  String body = server.arg("plain");
  // Parse JSON data
  
  DynamicJsonDocument jsonDoc(1024);
  DeserializationError error = deserializeJson(jsonDoc, body);
  if (error) {
    server.send(400, "text/plain", "Invalid JSON");
    return;
  }
  const char *value = jsonDoc["value"];
   // Clear the buffer.
  display.clearDisplay();

  // Display Text
  display.setTextSize(3);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println(value);
  display.display();
  server.send(200, "text/plain", "Success");
}
