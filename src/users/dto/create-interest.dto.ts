import { ApiProperty } from '@nestjs/swagger'

export class CreateInterestDto {
	@ApiProperty()
	title: string;

	@ApiProperty({ required: true })
	userid: number;
}
