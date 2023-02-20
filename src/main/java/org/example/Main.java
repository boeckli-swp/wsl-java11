package org.example;

import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.SystemUtils;

import javax.swing.*;

@Log4j2
public class Main {
    public static void main(String[] args) {

        System.out.println("Hello world!");

        System.out.println("Java Home is: " + SystemUtils.getJavaHome());

        log.info("hallo echo");
        
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });
    }

    /**
     * Create the GUI and show it.  For thread safety,
     * this method should be invoked from the
     * event-dispatching thread.
     */
    private static void createAndShowGUI() {
        //Create and set up the window.
        JFrame frame = new JFrame("HelloWorldSwing");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //Add the ubiquitous "Hello World" label.
        JLabel label = new JLabel("Hello World");
        frame.getContentPane().add(label);

        //Display the window.
        frame.pack();
        frame.setVisible(true);
    }
}
