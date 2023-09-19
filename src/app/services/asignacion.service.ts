import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { DataService } from './data.service';
import { ServiceService } from './service.service';

@Injectable({
  providedIn: 'root'
})
export class AsignacionService {

  constructor(
    private _servicio: ServiceService,
    private _data: DataService
  ) { }

  getAllAsignaturas() {
    const url = environment.ApiURL + environment.api.asignacion.name;
    return this._servicio.Promet(this._data.metodoGet(url));
  }

  asignarProfesor(data:any) {
    const url = environment.ApiURL + environment.api.asignacion.name + environment.api.asignacion.services.asignarProfesor;
    return this._servicio.Promet(this._data.metodoPut(url, data));
  }

  asignarEstudiante(data:any) {
    const url = environment.ApiURL + environment.api.asignacion.name + environment.api.asignacion.services.asignarEstudiante;
    return this._servicio.Promet(this._data.metodoPut(url, data));
  }
}
