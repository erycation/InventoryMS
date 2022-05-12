export interface UserDto {
    userId: string;
    firstname?: string | undefined;
    surname?: string | undefined;
    username?: string | undefined;
    password?: string | undefined;
    active: boolean;
    vendorId: string;
    roleDescription?: string | undefined;
    vendorName?: string | undefined;
    userStatus?: string | undefined;
}