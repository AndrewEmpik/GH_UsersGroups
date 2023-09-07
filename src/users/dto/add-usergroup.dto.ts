import { ApiProperty } from '@nestjs/swagger'

export class AddUserGroupDto {
	@ApiProperty({ required: true })
	userid: number;

	@ApiProperty({ required: true})
	groupid: number;
}
