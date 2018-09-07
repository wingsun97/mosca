var mosca = require('./index');

module.exports = {
    port: 1883,
    // host: "127.0.0.1", // specify an host to bind to a single interface
    id: 'trueiot01', // used to publish in the $SYS/<id> topicspace
    stats: true, // publish stats in the $SYS/<id> topicspace
    logger: {
        level: 'debug'
    },
    backend: {
        type: 'redis',
        port: 6379,
        host: 'localhost',
        return_buffers: true
    },
    persistence: {
        factory: mosca.persistence.Redis,
        port: 6379,
        host: 'localhost'
    },
    // secure: {
    //  keyPath: "/path/to/key",
    //  certPath: "/path/to/cert"
    // }
};