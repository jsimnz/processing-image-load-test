import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import javax.swing.*;
import java.awt.*;
import java.awt.image.WritableRaster;
import java.awt.image.BufferedImage;
import java.io.*;
import javax.imageio.*;

PImage img;
float t1;
float t2;
String imagePath = "/home/jsimnz/sketchbook/load_image_test/data.jpg"; // <---- CHANGE THIS FOR YOUR MACHINE. TOO LAZY TO MAKE IT WORK FOR THE GENERAL CASE
public int[] pixels;
public int width;
public int height;

void setup() {
  // Load an Image with processing loadImage
  t1 = millis();
  img = loadImage("./data.jpg");
  t2 = millis();
  println("[LOAD IMAGE (Processing)]: " + (t2 - t1));
  
  // Custom loadImage method 1
  Path path = Paths.get(imagePath);
  byte[] data;
  try {
    data = Files.readAllBytes(path);
    //Image img1 = new ImageIcon(data).getImage();
    img = new PImage(new ImageIcon(data).getImage());
  } catch (IOException e) {}
  t2 = millis();
  println("[LOAD IMAGE (Custom1)]: " + (t2 - t1));
    
  // Custum loadImage method 2
  t1 = millis();
  try {
    BufferedImage bimg = ImageIO.read(new File(imagePath));
    //img = new PImage(bimg);
  } catch (Exception e) {
    StringWriter sw = new StringWriter();
    e.printStackTrace(new PrintWriter(sw));
    String exceptionAsString = sw.toString();
    println(exceptionAsString);
  }
  t2 = millis();
  println("[LOAD IMAGE (Custom2)]: " + (t2 - t1));
}

void draw() {}
