import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()
async function main()
{
	const user1 = await prisma.users.upsert({
		where: { id:1 , name: 'User1' }, // id = 1 here is maybe incorrect
		update: {},
		create: {
			name: 'User1',
			interests:
			{
				create:
				{
					title: 'User1_interest',
				},
			},
		},
	})
}

main()
.then(async () => {
	await prisma.$disconnect()
})
.catch(async (e) => {
	console.error(e)
	await prisma.$disconnect()
	process.exit(1)
})
