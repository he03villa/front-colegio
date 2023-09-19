import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ProfesorService } from '../../services/profesor.service';

@Component({
  selector: 'app-modal-profesor',
  templateUrl: './modal-profesor.component.html',
  styleUrls: ['./modal-profesor.component.scss']
})
export class ModalProfesorComponent {

  form: FormGroup = new FormGroup({});
  arrayProfesor:any = [];

  constructor(
    private dialogRef: MatDialogRef<ModalProfesorComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private fb: FormBuilder,
    private _profesor: ProfesorService
  ) {
    this.iniciarForm();
    this.cagarProfesor();
  }

  iniciarForm() {
    this.form = this.fb.group({
      profesor: ['', Validators.compose([Validators.required])]
    });
  }

  async cagarProfesor() {
    const res = await this._profesor.getAllEstudiante();
    this.arrayProfesor = res;
    console.log(this.arrayProfesor);
  }

  save() {
    const idP = this.form.controls['profesor'].value;
    const profesor = this.arrayProfesor.find((f:any) => f.id == idP);
    this.salirModal(profesor);
    console.log(profesor);
  }

  salirModal(data:any = undefined) {
    this.dialogRef.close(data);
  }
}
