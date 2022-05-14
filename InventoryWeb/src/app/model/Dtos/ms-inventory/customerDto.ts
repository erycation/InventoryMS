export interface CustomerDto {
    customerId: string;
    dateInserted: Date;
    code?: string | undefined;
    firstName?: string | undefined;
    surname?: string | undefined;
    cellphoneNo?: string | undefined;
    emailAddress?: string | undefined;
    fullnames?: string | undefined;
}