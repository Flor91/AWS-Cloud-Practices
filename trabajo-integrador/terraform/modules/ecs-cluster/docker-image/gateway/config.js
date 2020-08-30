const path = require('path')

const config = {
  aws: {
    iot: {
      keyPath: '/usr/src/app/cert/certificate.private.key',
      certPath: '/usr/src/app/cert/certificate.cert.pem',
      caPath: '/usr/src/app/cert/certificate.root.pem',
      host: process.env.IOT_URI,
      topic: 'events'
    }
  }
}

module.exports = config
