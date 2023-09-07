import { PartialType } from '@nestjs/mapped-types';
import { AddUserGroupDto } from './add-usergroup.dto';

export class UpdateUsersGroupsDto extends PartialType(AddUserGroupDto) {}
