# WS2812B RGB LED Driver with Colorchooser Module

Overview
This project provides an implementation of a driver for WS2812B RGB LEDs, designed for a 16-LED matrix or ring, and includes a Colorchooser module for interactive color selection via buttons.

The project is designed for Pynq-Z2 and adheres to the WS2812B timing protocol, ensuring precise bit-level communication with the LEDs. 
<br> The Colorchooser module allows dynamic control of the first LED using button inputs.

## WS2812B Driver:

- Controls up to 16 LEDs in a matrix or ring configuration.
- Implements the WS2812B protocol with precise timing:
- T0H, T0L, T1H, T1L constants are based on a 50 MHz clock.
- Sends reset signal (>50 µs) at the end of a data transmission.
- Dynamically updates LED colors using the change_led input.
- Efficient state machine (load_led, load_bit, send_bit, reset) to manage data transmission.


## Colorchooser Module:

Accepts button inputs (BTN0, BTN1, BTN2) to select colors (Red, Green, Blue).
Outputs a 24-bit RGB color value (color).
Allows real-time color changes by integrating with the WS2812B driver.
