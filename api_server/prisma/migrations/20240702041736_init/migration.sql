-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'LOGIN_USER');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT,
    "role" "Role" NOT NULL DEFAULT 'LOGIN_USER',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dining" (
    "id" SERIAL NOT NULL,
    "restaurantName" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "menu" TEXT NOT NULL,
    "cuisines" TEXT NOT NULL,

    CONSTRAINT "Dining_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reservation" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "diningId" INTEGER NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Reservation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Reservation_diningId_startTime_endTime_key" ON "Reservation"("diningId", "startTime", "endTime");

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_diningId_fkey" FOREIGN KEY ("diningId") REFERENCES "Dining"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
