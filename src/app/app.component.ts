import { Component } from '@angular/core';
import { ServiceService } from './services/service.service';
import { AsignacionService } from './services/asignacion.service';
import { ModalProfesorComponent } from './component/modal-profesor/modal-profesor.component';
import { ModalEstudianteComponent } from './component/modal-estudiante/modal-estudiante.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Colegio';
  arrayAsignaturas:any = [];
  displayedColumns: string[] = ['nombre', 'curso', 'profesor', 'estudiante', 'accion'];
  dataSource:any;

  constructor(
    private _servicio: ServiceService,
    private _asignarura: AsignacionService
  ) {
    this.getAllAsignatura();
  }

  async getAllAsignatura() {
    const res = await this._asignarura.getAllAsignaturas();
    this.arrayAsignaturas = res;
    this.dataSource = res;
    console.log(this.arrayAsignaturas);
  }

  abrirModalProfesor(item:any) {
    const modalRef = this._servicio.openDialogo(ModalProfesorComponent, { height: '200px', width: '600px' });
    modalRef.afterClosed().subscribe(async (res:any) => {
      console.log(res);
      if (res) {
        const resul = await this._asignarura.asignarProfesor({ profesorId: res.id, id: item.id, nombre: '', cursoId: 0 });
        if (resul) {
          item.profesor = res;
        }
      }
    });
  }

  abrirModalEstudiante(item:any) {
    const modalRef = this._servicio.openDialogo(ModalEstudianteComponent, { height: '200px', width: '600px' });
    modalRef.afterClosed().subscribe(async (res:any) => {
      console.log(res);
      if (res) {
        const resul = await this._asignarura.asignarEstudiante({ estudianteId: res.id, asignaturaId: item.id });
        if (resul) {
          item.estudiantes.push(res);
        }
      }
    });
  }

}
