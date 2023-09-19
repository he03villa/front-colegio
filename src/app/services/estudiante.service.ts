import { Injectable } from '@angular/core';
import { ServiceService } from './service.service';
import { DataService } from './data.service';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class EstudianteService {

  constructor(
    private _servicio: ServiceService,
    private _data: DataService
  ) { }

  getAllEstudiante() {
    const url = environment.ApiURL + environment.api.estudiante.name;
    return this._servicio.Promet(this._data.metodoGet(url));
  }
}
