/*
  Warnings:

  - You are about to drop the column `driverId` on the `RequestTransfer` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "RequestTransfer" DROP CONSTRAINT "RequestTransfer_driverId_fkey";

-- AlterTable
ALTER TABLE "RequestTransfer" DROP COLUMN "driverId";
