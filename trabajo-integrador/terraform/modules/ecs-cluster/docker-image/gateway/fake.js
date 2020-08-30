const random = require('./random')

const fake = {
  createData () {
    let deviceTypes = ["FS-15", "LF-10", "PP-5"];

    function logaritmicRandom() {
      return (Math.log((Math.random()) + 1) / Math.log(2));
    }

    deviceId = Math.floor(logaritmicRandom() * 100);

    const data = {
      device: "device-" + deviceId,
      group: "group-" + deviceId % 10,
      devicetype: deviceTypes[deviceId % 3],
      date: new Date().toISOString(),
      inputcurrent: Math.floor(850 + logaritmicRandom() * 100),
      inputcurrentunit: "amp",
      inputvoltage: Math.floor(210 + logaritmicRandom() * 20),
      inputvoltageunit: "ac-v",
      temp1: Math.floor(45 + logaritmicRandom() * 10),
      temp1unit: "c",
      temp2: Math.floor(25 + logaritmicRandom() * 10),
      temp2unit: "c",
      scale1: Math.floor(35 + logaritmicRandom() * 10),
      scale1unit: "kg",
      scale2: Math.floor(12 + logaritmicRandom() * 5),
      scale2unit: "kg",
      flow: Math.floor(40 + logaritmicRandom() * 10),
      flowunit: "m3/h"
    }
    return data
  }
}

module.exports = fake
