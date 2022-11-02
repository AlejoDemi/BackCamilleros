import { PrismaClient, Status } from '@prisma/client'
import express from 'express'

const prisma = new PrismaClient()
var cors = require('cors')
const app = express()
app.use(cors())

app.use(express.json())



//LISTA DE TODOS LOS PACIENTES
app.get('/patients', async (req, res) => {
    const patients = await prisma.patient.findMany()
    res.json(patients)
})

//LISTA DE TODOS LOS DRIVERS
app.get('/drivers', async (req, res) => {
  const patients = await prisma.driver.findMany()
  res.json(patients)
})

//PUBLICAR UN NUEVO PACIENTE
app.post(`/patient`, async (req, res) => {
    const result = await prisma.patient.create({
      data: { ...req.body },
    })
    res.json(result)
})

//ESTE LO HICE DE PRUEBA, ES PARA CAMBIAR LA HABITACION DEL PACIENTE
app.put(`/patient/:id`,async (req,res) =>{
  try {
    console.log("champions?")
    const result = await prisma.patient.update({
      where:{id: req.params.id},
      data: {room: req.body.room}
    })
    res.json(result)
  }catch(e) {
    console.log(e)
  }
})

//CREAR UNA SOLICITUD DE TRASLADO
app.post(`/request`, async (req, res) => {
    const result = await prisma.requestTransfer.create({
      data: { ...req.body },
    })
    res.json(result)
})  

//PASAR UN TRASLADO DE PENDING A ACCEPTED
app.put(`/request/accept/:id`,async (req,res) =>{
  try {
    console.log("champions?")
    const result = await prisma.requestTransfer.update({
      where:{id: req.params.id},
      data: {status: Status.ACCEPTED}
    })
    res.json(result)
  }catch(e) {
    console.log(e)
  }
})

//PASAR UN TRASLADO DE ACCEPTED A IN-COURSE
app.put(`/request/start/:id`,async (req,res) =>{
  try {
    console.log("champions?")
    const result = await prisma.requestTransfer.update({
      where:{id: req.params.id},
      data: {status: Status.IN_COURSE}
    })
    res.json(result)
  }catch(e) {
    console.log(e)
  }
})

//PASAR UN TRASLADO DE IN-COURSE A CLOSED
app.put(`/request/close/:id`,async (req,res) =>{
  try {
    console.log("champions?")
    const result = await prisma.requestTransfer.update({
      where:{id: req.params.id},
      data: {status: Status.CLOSED}
    })
    res.json(result)
  }catch(e) {
    console.log(e)
  }
})

//LISTA DE TODAS LAS SOLICITUDES
app.get('/requests', async (req, res) => {
    const patients = await prisma.requestTransfer.findMany()
    res.json(patients)
})

//CREAR UN NUEVO CAMILLERO
app.post(`/driver`, async (req, res) => {
  const result = await prisma.driver.create({
    data: { ...req.body },
  })
  res.json(result)
}) 

app.listen(8080, () =>
  console.log('REST API server ready at: http://localhost:8080'),
)
