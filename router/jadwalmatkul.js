const express = require("express");
const jadwalMatkulController=require("../controller/jadwalMatkulController")
const routeJadwalMatkul = express.Router();

routeJadwalMatkul.post('/',jadwalMatkulController.create)
routeJadwalMatkul.get('/get',jadwalMatkulController.getAll)
routeJadwalMatkul.get('/get/:id',jadwalMatkulController.getById)
routeJadwalMatkul.put('/update/:id',jadwalMatkulController.update)
routeJadwalMatkul.delete('/delete/:id',jadwalMatkulController.delete)

module.exports=routeJadwalMatkul