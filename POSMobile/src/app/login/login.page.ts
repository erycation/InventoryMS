import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AlertController, LoadingController } from '@ionic/angular';
import { AuthenticationService } from '../services/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  credentials: FormGroup;

  constructor(private fb: FormBuilder,
              private authService: AuthenticationService,
              private alertController: AlertController,
              private router: Router,
              private loadingController: LoadingController) { }

              ngOnInit() {

                this.authService.logout();
                this.credentials = this.fb.group({
                  username: ['', [Validators.required]],
                  password: ['', [Validators.required]],
                });
                

                 /*
                this.credentials = this.fb.group({
                  email: ['', [Validators.required, Validators.email]],
                  password: ['', [Validators.required, Validators.minLength(6)]],
                });
                */

              }

  async login() {
    const loading = await this.loadingController.create();
    await loading.present();
    
    this.authService.login(this.credentials.value).subscribe(
      async (res) => {
        await loading.dismiss();        
        this.router.navigateByUrl('/', { replaceUrl: true });
      },
      async (res) => {
        await loading.dismiss();
        const alert = await this.alertController.create({
          header: 'Login failed',
          message: res.error.error,
          buttons: ['OK'],
        });
 
        await alert.present();
      }
    );
  }


  async onSubmit() {
    const alert = await this.alertController.create({
      cssClass: 'my-custom-class',
      header: 'Alert',
      message: 'Username And Password Required.',
      buttons: ['OK']
    });

    await alert.present();
    await alert.onDidDismiss();

    //const { role } = await alert.onDidDismiss();
    //console.log('onDidDismiss resolved with role', role);
  }
  
 }


