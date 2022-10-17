const express = require('express');
const admin = require('../middlewares/adminMiddleware')
const Product = require('../models/product');
const adminRouter = express.Router();


//Add Products api

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
    
});

//Display Products api

adminRouter.get('/admin/get-products', admin, async(req, res) => {
    try {
        const products = await Product.find({})
        res.json(products);
    } catch (error) {
        res.status(500).json({
            error: error.message
        });
    }
});

//Delete Products api

adminRouter.post('/admin/delete-product', admin, async(req, res) => {
    try {
        const {id} =req.body;
        let product = await Product.findByIdAndDelete(id);
      
        res.json(product);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
    
});

module.exports = adminRouter;