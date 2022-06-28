import { Injectable } from "@angular/core";
import { BackendService } from "src/app/util/backend.service";
import { UserGenerateInvCertDto } from "./userGenerateInvCertDto";

@Injectable({
    providedIn: 'root'
})
export class ReconcilationReportReportService {

    constructor(private backend: BackendService) {
    }

    generateInventoryCertificate(userGenerateInvCertDto: UserGenerateInvCertDto)
    {
        return this.backend.postWithResponse1<any>(`ReconcilationReport/Generate`, userGenerateInvCertDto);
    }

    async downloadReconcilationReport(inventoryCertificateId: string, reportType: string) {
        return await this.backend.downloadFilePDF(`ReconcilationReport/${inventoryCertificateId}/${reportType}`);
    }
}
