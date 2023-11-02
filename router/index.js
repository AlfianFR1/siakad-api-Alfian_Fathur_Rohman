const express = require("express");
const exampleController = require("../controller/exampleController");
const routeMahasiswa=require("./mahasiswa");
const routeDosen=require("./dosen");
const routeMatkul = require("./matakuliah");
const routeDsnMat = require("./dosenmatkul");
const routeJadwalMatkul = require("./jadwalmatkul");
const routeDsnMhs = require("./mahasiswabimbingan");
const route = express.Router()

route.get('/',exampleController.index)
route.use('/mahasiswa',routeMahasiswa)
route.use('/dosen',routeDosen)
route.use('/matkul',routeMatkul)
route.use('/dosen-matkul',routeDsnMat)
route.use('/jadwal-matkul',routeJadwalMatkul)
route.use('/mahasiswa-bimbingan',routeDsnMhs)

module.exports = route