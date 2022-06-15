const jwt = require('jsonwebtoken');

const auth = async(req, res, next) => {
    try {
        const token = req.header('token');

        if(!token) {
            return res.status(401).json({
                msg: 'No token found, Access Denied'
            });
        }
        const verifiedToken = await jwt.verify(token, 'passwordKey');

        if(!verifiedToken) {
            return res.status(401).json({
                msg: 'Token verification failed. Access Denied'
            });
        }

        //Saving id in req.user, for middleware
        req.user = verifiedToken.id;
        req.token = token;
        next();
    }catch(e) {
        res.status(500).json({error: e.message});
    }
}
module.exports = auth;