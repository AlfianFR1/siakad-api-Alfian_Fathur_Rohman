const {JadwalMatkul, MataKuliah} =require("../models")
const jadwalmatkul = require("../models/jadwalmatkul")

const jadwalMatkulController = {}

/*
    this is auto generate example, you can continue 

*/
jadwalMatkulController.index = async(req,res) => {
    res.json({
        message : "Hello jadwalMatkulController"
    })
}

jadwalMatkulController.create = async (req,res)=>{
    const {id_matkul, hari, jam}=req.body
    try{
        const getMatkul = await MataKuliah.findOne({
            where : {
                id : id_matkul
            }
        })
        if(getMatkul === null){
            throw Error("Data tidak ditemukan")
        }else{
            const createJdwl = await JadwalMatkul.create({
                id_matkul : getMatkul.id,
                hari : hari,
                jam:jam
            })
            return res.status(201).json({
                message : 'Data berhasil ditambahkan !'
            })
        }
    }catch (error){
        return res.status(404).json({
            message : error.message
        })
    }
}

jadwalMatkulController.getAll = async (req, res) => {
    try {
        const mataKuliahData = await MataKuliah.findAndCountAll();
        const dataWithJadwal = await Promise.all(
            mataKuliahData.rows.map(async (mataKuliah) => {
                const jadwalMataKuliahData = await JadwalMatkul.findAll({
                    where: { id_matkul: mataKuliah.id },
                });
                return {
                    ...mataKuliah.toJSON(),
                    jadwalMataKuls: jadwalMataKuliahData,
                };
            })
        );

        res.json({
            data: dataWithJadwal,
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Gagal mengambil data" });
    }
}

jadwalMatkulController.getById = async (req, res) => {
    const { id } = req.params;
    try {
        const getjadwal = await MataKuliah.findOne({
            where: {
                id: id
            }
        });

        if (!getjadwal) {
            return res.status(404).json({
                message: "Mata kuliah tidak ditemukan"
            });
        }

        const jadwalMataKuliahData = await JadwalMatkul.findAll({
            where: { id_matkul: getjadwal.id },
        });

        const formattedMataKuliah = {
            ...getjadwal.dataValues,
            jadwalMataKuls: jadwalMataKuliahData.map(jadwal => jadwal.dataValues),
        };

        return res.status(200).json(formattedMataKuliah);
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            message: error.message
        });
    }
}



jadwalMatkulController.update = async (req,res)=>{
    const {id_matkul, hari, jam} = req.body
    const {id}=req.params
    try{
        const getMatkul = await MataKuliah.findOne({
            where : {
                id : id_matkul,

            }
        })
        if(getMatkul === null){
            throw Error("Data tidak ditemukan")
        }else{
            const createJdwl = await JadwalMatkul.update({
                id_matkul : getMatkul.id,
                hari : hari,
                jam : jam
            },{
                where : {
                    id : id
                }
            })
            return res.status(201).json({
                message : 'Data berhasil diubah !'
            })
        }
    }catch (error){
        return res.status(404).json({
            message : error.message
        })

    }

    
}

jadwalMatkulController.delete =async(req,res)=>{
    const {id} = req.params
    try{
        const deleteJadwal=await JadwalMatkul.destroy({
        where:{
            id : id
        }
        })
        return res.status(200).json({
            message : 'Data berhasil dihapus !'
        })
    }catch(error){
        console.log(error)
        return res.status(500).json({
            message : error
        })
    }
}

module.exports = jadwalMatkulController

