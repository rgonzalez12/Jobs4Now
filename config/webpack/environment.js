const { environment } = require('@rails/webpacker');

// Add Babel loader for ES6+ syntax
const babelLoader = environment.loaders.get('babel');
babelLoader.test = /\.(js|jsx|mjs)$/;
babelLoader.exclude = /node_modules/;

// Optional: Configure additional settings for performance or compatibility
module.exports = environment;