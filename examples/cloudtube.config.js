module.exports = {
/*
  Copy this file to `config.js`, and add options here.
  They'll override the options from `utils/constants.js`.
  For example, the next block changes the default instance.
*/
        user_settings: {
                instance: {
                        default: "http://newleaf:3000"
                }
        },
        /*
          If cloudtube and Newleaf is not in same docker-network, you need to also set local_instance_origin.
        */
        server_setup: {
                local_instance_origin: "http://newleaf:3000"
        }
}
