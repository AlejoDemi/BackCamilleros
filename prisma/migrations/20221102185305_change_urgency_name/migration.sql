/*
  Warnings:

  - You are about to drop the column `leverOfUrgency` on the `RequestTransfer` table. All the data in the column will be lost.
  - Added the required column `levelOfUrgency` to the `RequestTransfer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "RequestTransfer" DROP COLUMN "leverOfUrgency",
ADD COLUMN     "levelOfUrgency" "Urgency" NOT NULL;
