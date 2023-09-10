-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Groups" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Interests" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "userid" INTEGER NOT NULL,

    CONSTRAINT "Interests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsersGroups" (
    "id" SERIAL NOT NULL,
    "userid" INTEGER NOT NULL,
    "groupid" INTEGER NOT NULL,

    CONSTRAINT "UsersGroups_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UK_USER_GROUP" ON "UsersGroups"("userid", "groupid");

-- AddForeignKey
ALTER TABLE "Interests" ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY ("userid") REFERENCES "Users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "UsersGroups" ADD CONSTRAINT "FK_GROUP_ID" FOREIGN KEY ("groupid") REFERENCES "Groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "UsersGroups" ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY ("userid") REFERENCES "Users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
