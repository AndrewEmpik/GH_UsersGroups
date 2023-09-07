import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { CreateGroupDto } from './dto/create-group.dto';
import { UpdateGroupDto } from './dto/update-group.dto';
import { CreateInterestDto } from './dto/create-interest.dto';
import { UpdateInterestDto } from './dto/update-interest.dto';
import { UpdateUsersGroupsDto } from './dto/update-usergroup.dto';
import { AuthGuard } from '@nestjs/passport'

@Controller('users')
@UseGuards(AuthGuard('api-key'))
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  	/////////////////////
  	////// CRUD'S //////
  	///////////////////

  	/// USERS ///

	// [Users] GET: users/
	@Get()
	findAll() {
		return this.usersService.findAll();
	}

	// [Users] CREATE: users/
	@Post()
	create(@Body() createUserDto: CreateUserDto) {
		return this.usersService.create(createUserDto);
	}

	// [Users] UPDATE: users/:id
	@Patch(':id')
	update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
		return this.usersService.update(+id, updateUserDto);
	}
	
	// [Users] DELETE: users/:id
	@Delete(':id')
	remove(@Param('id') id: string) {
		return this.usersService.remove(+id);
	}

	/// GROUPS ///

	// [Groups]  GET: users/groups/
	@Get('groups')
	findGroups() {
		return this.usersService.findGroups();
	}

	// [Groups]  CREATE: users/groups/
	@Post('groups')
	createGroup(@Body() createGroupDto: CreateGroupDto) {
		return this.usersService.createGroup(createGroupDto);
	}
	// [Groups]  UPDATE: users/groups/:id
	@Patch('groups/:id')
	updateGroup(@Param('id') id: string, @Body() updateGroupDto: UpdateGroupDto) {
		return this.usersService.updateGroup(+id, updateGroupDto);
	}
	// [Groups]  DELETE: users/groups/:id
	@Delete('groups/:id')
	removeGroup(@Param('id') id: string) {
		return this.usersService.removeGroup(+id);
	}

	/// INTERESTS ///

	// [Interests] GET: users/interests/
	@Get('interests')
	findInterests() {
		return this.usersService.findInterests();
	}

	// [Interests]  CREATE: users/interests/
	@Post('interests')
	createInterest(@Body() createInterestDto: CreateInterestDto) {
		return this.usersService.createInterest(createInterestDto);
	}
	// [Interests]  UPDATE: users/interests/:id
	@Patch('interests/:id')
	updateInterest(@Param('id') id: string, @Body() updateInterestDto: UpdateInterestDto) {
		return this.usersService.updateInterest(+id, updateInterestDto);
	}
	// [Interests]  DELETE: users/interests/:id
	@Delete('interests/:id')
	removeInterest(@Param('id') id: string) {
		return this.usersService.removeInterest(+id);
	}

	/// USERSGROUPS ///

	// [UsersGroups]  GET: users/users_to_groups
	@Get('users_to_groups')
	findUsersGroups() {
		return this.usersService.findUsersGroups();
	}
	// [UsersGroups]  CREATE: users/users_to_groups/create
	// same as "addtogroup"

	// [UsersGroups]  UPDATE: users/users_to_groups/:id
	@Patch('users_to_groups/:id')
	updateUsersGroups(@Param('id') id: string, @Body() updateUsersGroupsDto: UpdateUsersGroupsDto) {
		return this.usersService.updateUsersGroups(+id, updateUsersGroupsDto);
	}
	// [UsersGroups]  DELETE: users/users_to_groups/:id
	@Delete('users_to_groups/:id') 
	removeUsersGroups(@Param('id') id: string) {
		return this.usersService.removeUsersGroups(+id);
	}

	////////////////////////////////
  	////// SPECIAL ENDPOINTS //////
  	//////////////////////////////

	// to retrieve all groups for a specific user:	users/:id/groups
	@Get(':id/groups')
		findUserGroups(@Param('id') id: string) {
		return this.usersService.findUserGroups(+id);
	}

	// to retrieve all interests for a specific user:	users/:id/interests
	@Get(':id/interests')
		findUserInterests(@Param('id') id: string) {
		return this.usersService.findUserInterests(+id);
	}

	// to add a user to a group:	users/:userid/addtogroup/:groupid
	@Post(':userid/addtogroup/:groupid')
		addUserToGroup(@Param('userid') userid: string, @Param('groupid') groupid: string) {
		return this.usersService.addUserToGroup(+userid,+groupid);
	}

	// to remove a user from a group:	users/:userid/removefromgroup/:groupid
	@Delete(':userid/removefromgroup/:groupid')
		removeUserFromGroup(@Param('userid') userid: string, @Param('groupid') groupid: string) {
		return this.usersService.removeUserFromGroup(+userid,+groupid);
	}

}
