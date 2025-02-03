import CoreLocation

/**
 * iOS Utility to do a beacon calibration.
 *
 * The end user should be instructed to hold the phone 1 meter away from the beacon and hold it
 * steady for at least 30 seconds until the calibration is complete.
 *
 * To use this class:
 *
 * 1. Set up beacon ranging in your app.  You should keep track of the identifiers of a single
 *    beacon you wish to calibrate.
 * 2. When you find a beacon you wish to calibrate, make a note of its identifiers, and then
 *    make a new instance of this class (or call clear() on an existing instance).
 * 2. In your beacon ranging callback method, call addSample(beacon) with the beacon object matching
 *    the identifiers of the beacon you are calibrating.
 * 3. Call getPercentComplete() to see if you have enough samples.
 * 4. (Optional) Update your user interface to show the user the percent complete
 * 5. Once 100 percent complete, call getCalibratedPower() to get the calibrated power of the beacon
 *
 * If your beacon manufacturer supports configuration of the beacon via a SDK, use the SDK to store
 * the value from step 5 in the beacon's measured power.  If not, you may need to instruct the user
 * to use the beacon manufacturer's custom app to configure this value into the beacon.
 *
 */
class CalibrationTool {
    /**
     * By convention, 30 seconds of samples are required to calibrate a beacon.  You can adjust this
     * if needed for your use case.
     */
    var minSampleCount = 30
    private var samples: [CLBeacon] = []

    /**
     * Call this method from the didRangeBeacons callback, passing a single object of the beacon
     */
    func addSample(beacon: CLBeacon) {
        if (getPercentComplete() < 100) {
            if (beacon.rssi != 0) {
                samples.append(beacon)
            }
        }
    }

    /**
     * Call this once you are done collecting samples and wish to start over for a new
     * calibration
     */
    func clear() {
        samples = []
    }

    /**
     * Returns the calibrated power of the beacon based on the samples collected so far
     * or null if not enough samples have been collected
     */
    func getCalibratedPower() -> Int? {
        if (samples.count < minSampleCount) {
            return nil
        }
        var totalRssi = 0
        for beacon in samples {
            totalRssi += beacon.rssi
        }
        return totalRssi / samples.count
    }

    /**
     * Returns the percentage of required samples collected so far
     */
    func getPercentComplete() -> Int {
        return (samples.count * 100) / minSampleCount
    }
}
