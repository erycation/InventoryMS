
export interface AuthToken {
    userId: string;
    username?: string | undefined;
    fullName?: string | undefined;
    firstname?: string | undefined;
    surname?: string | undefined;
    success: boolean;
    message?: string | undefined;
    token?: string | undefined;
    roleDescription?: string | undefined;
    vendorId: string;
    vendorName?: string | undefined;
}

