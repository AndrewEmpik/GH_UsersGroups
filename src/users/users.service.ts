import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { CreateGroupDto } from './dto/create-group.dto';
import { UpdateGroupDto } from './dto/update-group.dto';
import { CreateInterestDto } from './dto/create-interest.dto';
import { UpdateInterestDto } from './dto/update-interest.dto';
import { UpdateUsersGroupsDto } from './dto/update-usergroup.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { title } from 'process';
import { AddUserGroupDto } from './dto/add-usergroup.dto';

@Injectable()
export class UsersService {
	constructor(private prisma: PrismaService) {}

  	/////////////////////
  	////// CRUD'S //////
  	///////////////////

  	/// USERS ///

	// [Users] GET: users/
	findAll() {
		return this.prisma.users.findMany({});
	}

	// [Users] CREATE: users/create
	create(createUserDto: CreateUserDto) {
		return this.prisma.users.create({data: createUserDto });
	}

	// [Users] UPDATE: users/:id/update/
	update(id: number, updateUserDto: UpdateUserDto) {
		return this.prisma.users.update({
			where: { id },
			data: updateUserDto,
		});
	}

	// [Users] DELETE: users/:id/remove/
	remove(id: number) {
		return this.prisma.users.delete({ where: {id}});
	}

	/// GROUPS ///

	// [Groups]  GET: users/groups/
	findGroups() {
		return this.prisma.groups.findMany({});
	}

	// [Groups]  CREATE: users/groups/create
	createGroup(createGroupDto: CreateGroupDto) {
		return this.prisma.groups.create({data: createGroupDto });
	}

	// [Groups]  UPDATE: users/groups/:id/update
	updateGroup(id: number, updateGroupDto: UpdateGroupDto) {
		return this.prisma.groups.update({
			where: { id },
			data: updateGroupDto,
		});
	}

	// [Groups]  DELETE: users/groups/:id/remove
	removeGroup(id: number) {
		return this.prisma.groups.delete({ where: {id}});
	}

	/// INTERESTS ///

	// [Interests] GET: users/interests/
	findInterests() {
		return this.prisma.interests.findMany({});
	}

	// [Interests]  CREATE: users/interests/create
	createInterest(createInterestDto: CreateInterestDto) {
		return this.prisma.interests.create({data: createInterestDto });
	}

	// [Interests]  UPDATE: users/interests/:id/update
	updateInterest(id: number, updateInterestDto: UpdateInterestDto) {
		return this.prisma.interests.update({
			where: { id },
			data: updateInterestDto,
		});
	}

	// [Interests]  DELETE: users/interests/:id/remove
	removeInterest(id: number) {
		return this.prisma.interests.delete({ where: {id}});
	}

	/// USERSGROUPS ///

	// [UsersGroups]  GET: users/users_to_groups
	findUsersGroups() {
		return this.prisma.usersGroups.findMany({});
	}

	// [UsersGroups]  CREATE: users/users_to_groups/create
	// same as "addtogroup"

	// [UsersGroups]  UPDATE: users/users_to_groups/:id/update
	updateUsersGroups(id: number, updateUsersGroupsDto: UpdateUsersGroupsDto) {
		return this.prisma.usersGroups.update({
			where: { id },
			data: updateUsersGroupsDto,
		});
	}

	// [UsersGroups]  DELETE: users/users_to_groups/:id/remove
	removeUsersGroups(id: number) {
		return this.prisma.usersGroups.delete({ where: {id}});
	}

	////////////////////////////////
  	////// SPECIAL ENDPOINTS //////
  	//////////////////////////////

	// to retrieve all groups for a specific user:	users/:id/groups
	async findUserGroups(id: number) {
		const user = await this.prisma.usersGroups.findMany({
			where: { userid: id },
			select: {  group: {select: {title: true} }},
		  });

		return user.map((item) => item.group.title);;
	}

	// to retrieve all interests for a specific user:	users/:id/interests
	async findUserInterests(id: number) {
		const user = await this.prisma.users.findUnique({
			where: { id },
			include: {  interests: true },
		  });

		return user.interests.map((interest) => interest.title);
	}

	// to add a user to a group:	users/:userid/addtogroup/:groupid
	addUserToGroup(userid: number, groupid: number) {
		return this.prisma.usersGroups.create({data: {userid: userid, groupid: groupid} });
	}

	// to remove a user from a group:	users/:userid/removefromgroup/:groupid
	removeUserFromGroup(userid: number, groupid: number) {
		return this.prisma.usersGroups.deleteMany({where:{userid,groupid}});
	}

}
