                                    -- CreateEnum
CREATE TYPE "Status" AS ENUM ('PENDING', 'ACCEPTED', 'IN_COURSE', 'CLOSED');

-- CreateEnum
CREATE TYPE "Urgency" AS ENUM ('HIGH', 'MEDIUM', 'LOW');

-- CreateTable
CREATE TABLE "RequestTransfer" (
    "id" TEXT NOT NULL,
    "areaFrom" TEXT NOT NULL,
    "areaTo" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "status" "Status" NOT NULL,
    "driverId" TEXT NOT NULL,
    "leverOfUrgency" "Urgency" NOT NULL,

    CONSTRAINT "RequestTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Response" (
    "id" TEXT NOT NULL,
    "driverId" TEXT NOT NULL,
    "requestId" TEXT NOT NULL,

    CONSTRAINT "Response_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Driver" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Driver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Patient" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "room" TEXT NOT NULL,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Response_requestId_key" ON "Response"("requestId");

-- AddForeignKey
ALTER TABLE "RequestTransfer" ADD CONSTRAINT "RequestTransfer_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RequestTransfer" ADD CONSTRAINT "RequestTransfer_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Response" ADD CONSTRAINT "Response_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Response" ADD CONSTRAINT "Response_requestId_fkey" FOREIGN KEY ("requestId") REFERENCES "RequestTransfer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
