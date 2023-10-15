const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = {
  devServer: {
    before: function(app) {
      app.use(
        '/oauth',
        createProxyMiddleware({
          target: 'http://localhost:8080',
          changeOrigin: true,
          secure: false
        })
      );
    }
  }
};