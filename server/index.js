const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin'); 
const PORT = 3000;
const app = express();
const DataBase = "mongodb+srv://flutter_amazon:flutteramazon123@cluster0.efklo.mongodb.net/?retryWrites=true&w=majority";
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

mongoose.connect(DataBase)
.then(() => {
    console.log("Connection successfull");
})
.catch((err) => {
    console.log(err);
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected at port ${PORT}`);
});