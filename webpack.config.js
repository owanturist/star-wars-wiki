'use strict';

const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: path.resolve('./src/index.js'),

    output: {
        path: path.resolve('./dist'),
        filename: '[hash].js'
    },

    resolve: {
        extensions: [
            '',
            '.js',
            '.elm'
        ]
    },

    module: {
        noParse: /\.elm$/,

        loaders: [
            {
                test: /\.elm$/,
                exclude: [
                    /elm-stuff/,
                    /node_modules/
                ],
                loader: [
                    'elm-hot-loader',
                    'elm-webpack-loader'
                        + '?warn=true'
                        + '&debug=true'
                ].join('!')
            }
        ]
    },

    devServer: {
        stats: 'errors-only',
        historyApiFallback: true
    },

    plugins: [
        new HtmlWebpackPlugin({
            template: path.resolve('./src/index.html'),
            inject: 'body'
        })
    ]
};
