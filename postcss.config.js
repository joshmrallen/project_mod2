module.exports = {
  plugins: [
    require('postcss-import'),
    require('dotenv').config(),
    console.log(process.env),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
