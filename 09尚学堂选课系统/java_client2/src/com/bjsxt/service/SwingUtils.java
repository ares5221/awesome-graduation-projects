package com.bjsxt.service;

import java.awt.event.KeyEvent;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.KeyStroke;

public class SwingUtils {
	 public static void enterPressesWhenFocused(JButton button) {
	        button.registerKeyboardAction(button.getActionForKeyStroke(KeyStroke
	                .getKeyStroke(KeyEvent.VK_SPACE, 0, false)),
	                KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0, false),
	                JComponent.WHEN_FOCUSED);
	        button.registerKeyboardAction(button.getActionForKeyStroke(KeyStroke
	                .getKeyStroke(KeyEvent.VK_SPACE, 0, true)),
	                KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0, true),
	                JComponent.WHEN_FOCUSED);
	    }
}
