const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String, 
        required:true,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'Please enter a valid email',
        },
    },
    password: {
        required: true, 
        type: String,
        validate: {
            validator: (value) => {
                return value.length > 6;
            },
            message: "Password too small, provide a longer one",
        }
    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: 'user',
    }
});


const User = mongoose.model('User', userSchema);
module.exports = User;