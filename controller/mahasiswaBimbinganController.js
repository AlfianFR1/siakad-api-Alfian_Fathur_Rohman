const {Dosen, MahasiswaBimbingan, Mahasiswa} =require("../models")
const mahasiswaBimbinganController = {}

/*
    this is auto generate example, you can continue 

*/
mahasiswaBimbinganController.index = async(req,res) => {
    res.json({
        message : "Hello mahasiswaBimbinganController"
    })
}

mahasiswaBimbinganController.create = async (req,res)=>{
    const {id_dosen,id_mahasiswa}=req.body
    try{
        const getDosen = await Dosen.findOne({
            where : {
                id : id_dosen
            }
        })
        const getMahasiswa = await Mahasiswa.findOne({
            where : {
                id : id_mahasiswa
            }
        })
        if(getDosen === null || getMahasiswa === null){
            throw Error("Data tidak ditemukan")
        }else{
            const createDsnMhs = await MahasiswaBimbingan.create({
                id_dosen : getDosen.id,
                id_mahasiswa : getMahasiswa.id
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

mahasiswaBimbinganController.getAll=async(req,res)=>{
    const getDsnMhs = await Dosen.findAll({
        include : [
            {
                model : Mahasiswa
            }
        ]
    })
    res.json({
        data : getDsnMhs
    })
}

mahasiswaBimbinganController.getById=async(req,res)=>{
    const{id}=req.params
    const getDsnMhs = await Dosen.findOne({
        include : [
            {
                model : Mahasiswa
            }
        ],
        where : {
            id : id
        }
    })
    res.json({
        data : getDsnMhs
    })
}

mahasiswaBimbinganController.update = async (req,res)=>{
    const {id_dosen, id_mahasiswa} = req.body
    const {id}=req.params
    try{
        const getDosen = await Dosen.findOne({
            where : {
                id : id_dosen
            }
        })
        const getMahasiswa = await Mahasiswa.findOne({
            where : {
                id : id_mahasiswa
            }
        })
        if(getDosen === null || getMahasiswa === null){
            throw Error("Data tidak ditemukan")
        }else{
            const createDsnMhs = await MahasiswaBimbingan.update({
                id_dosen : getDosen.id,
                id_mahasiswa : getMahasiswa.id
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

mahasiswaBimbinganController.delete =async(req,res)=>{
    const {id} = req.params
    try{
        const deleteDsnMhs=await MahasiswaBimbingan.destroy({
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

module.exports = mahasiswaBimbinganController

