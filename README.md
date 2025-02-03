# Beacon Calibration Sample Code

This repository contains sample code for iOS and Android to calibrate a Bluetooth beacon.

* iOS Sample
* [Andorid Sample](https://github.com/davidgyoung/beacon-calibration-sample-code/blob/main/CalibrationTool.kt)

## What is calibration?

Calibration means measuing the signal output of a beacon at a known reference distance (by standard convention one meter) using a receiver.  This is typically done by taking a number of samples over 30 seconds or more to measure the RSSI (Received Signal Strength Indicator)  of the beacon at the phone. 
The average value of RSSI over this period is the "measured power".  This value can then be configured inside a beacon, so it can be put into the beacon avertisement.  The presence of the measured power inside the beacon advertisement allows other receivers to know what the expected measured power is at the once meter reference distance.
This allows the receiver to estimate whether it it closer or futher away than the one meter reference distance by wether the actual RSSI of the beacon detection is weaker or stronger thany the measured power value in the beacon advertisement.

## Why caliberate?

Calibrating a beacon after installation allows receivers (typically mobile apps) to make more accurate distance estimates.  (Read more about how distance estimates work in my blog post [here](http://www.davidgyoungtech.com/2020/05/15/how-far-can-you-go)).

## When should you calibrate?

Calibration should be redone after the beacon is installed, replaced or moved, or if the physical surroundings near the beacon (barriers, walls, obstacles) are changed after installation.

## Limitations

Calibration assumes that different receiving devices (typically mobile phones) all measure the same signal for the same beacon.  While this is very roughly true, in practice, individual phones models often vary by +/- 3 dB in RSSI for their average measurement the same beacon.  
Beacuase the phone that does the calibration won't be representative of all phones, the calibration won't be perfect.  Your best bet is to choose the most common phone make / model (e.g. either the the newest Apple or Samsung model depending on what is most common in hour area) and that will be the best you can do.  Read more about this problem in my blog post [here](http://www.davidgyoungtech.com/2020/05/15/how-far-can-you-go)


## Need Help?

If you need expert help with your beacon project, contact David G. Young [here](http://www.davidgyoungtech.com).


