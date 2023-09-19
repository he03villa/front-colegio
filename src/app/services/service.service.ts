import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(
    private dialog: MatDialog
  ) { }

  addLoading(target:any) {
    if (target) {
      target.innerHTML += " <i class='fas fa-spinner fa-pulse'></i>"; 
      target.disabled = true;
    }
  }

  removeLoading(target:any) {
    if (target) {
      let sprinner = target.lastChild;
      target.removeChild(sprinner);
      target.disabled = false;
    }
  }

  async Promet(subscribe: any) {
    return new Promise((resolve, reject) => subscribe.subscribe(async (resul: any) => {
      resolve(resul); 
    }, (error: any) => resolve(error)));
  }

  openDialogo(component:any, data:any = undefined) {
    const dialoRef = this.dialog.open(component, data);
    return dialoRef;
  }
}
