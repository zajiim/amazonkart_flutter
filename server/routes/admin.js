const express = require('express');
const admin = require('../middlewares/adminMiddleware')
const Product = require('../models/product');
const adminRouter = express.Router();

adminRouter.post('/admin/add-product', admin, async(req, res) => {
    try {
        const {name, description, images, quantity, price, category} = req.body
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        product = await product.save();
        res.json(product);
    } catch (error) {
        res.status(500).json({ message: error.message })
    }
    
})

module.exports = adminRouter;