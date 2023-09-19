import { Component, Inject } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { EstudianteService } from '../../services/estudiante.service';

@Component({
  selector: 'app-modal-estudiante',
  templateUrl: './modal-estudiante.component.html',
  styleUrls: ['./modal-estudiante.component.scss']
})
export class ModalEstudianteComponent {

  form: FormGroup = new FormGroup({});
  arrayEstudiante:any = [];

  constructor(
    private dialogRef: MatDialogRef<ModalEstudianteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private fb: FormBuilder,
    private _estudiante: EstudianteService
  ) {
    this.iniciarForm();
    this.cagarProfesor();
  }

  iniciarForm() {
    this.form = this.fb.group({
      estudiante: ['', Validators.compose([Validators.required])]
    });
  }

  async cagarProfesor() {
    const res = await this._estudiante.getAllEstudiante();
    this.arrayEstudiante = res;
    console.log(this.arrayEstudiante);
  }

  save() {
    const idP = this.form.controls['estudiante'].value;
    const estudiante = this.arrayEstudiante.find((f:any) => f.id == idP);
    this.salirModal(estudiante);
  }

  salirModal(data:any = undefined) {
    this.dialogRef.close(data);
  }
}
