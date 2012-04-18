package nl.xedus.phase;

import java.awt.*;
import javax.swing.*;

public class MainActivity {
	static String tuna = "k";
	 private static void createWindow() {
		 JFrame frame = new JFrame("Phase Alpha v0.0.1"); 
		 frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		 JLabel textLabel = new JLabel(tuna,SwingConstants.CENTER); textLabel.setPreferredSize(new Dimension(300, 100));
		 frame.getContentPane().add(textLabel, BorderLayout.CENTER);
		 //Display the window. 
		 frame.setLocationRelativeTo(null); 
		 frame.setIconImage(new ImageIcon("Resources/icon_32.png").getImage());
		 frame.setSize(800, 600);
		 frame.setVisible(true); 
		
		 
	 } 
	 public static void main(String[] args) {
		 
		 int burger = 0;
		 if (burger == 1){
			 tuna = "You got 1 burger";
		 }else{
			 tuna = "You got more or less then one burger";
		 }
		 createWindow();
	 } 
}