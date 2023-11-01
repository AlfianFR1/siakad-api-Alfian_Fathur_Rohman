const express = require("express");
const mahasiswaBimbinganController=require("../controller/mahasiswaBimbinganController")
const routeDsnMhs = express.Router();

routeDsnMhs.post('/',mahasiswaBimbinganController.create)
routeDsnMhs.get('/get',mahasiswaBimbinganController.getAll)
routeDsnMhs.get('/get/:id',mahasiswaBimbinganController.getById)
routeDsnMhs.put('/update/:id',mahasiswaBimbinganController.update)
routeDsnMhs.delete('/delete/:id',mahasiswaBimbinganController.delete)

module.exports=routeDsnMhs