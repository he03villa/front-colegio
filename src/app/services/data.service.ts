import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(
    private _http: HttpClient,
  ) { }

  metodoGet(url: string) {
    return this._http.get(url);
  }

  metodoPost(url: string, body:any) {
    return this._http.post(url, body);
  }

  metodoPut(url: string, body:any) {
    return this._http.put(url, body);
  }

  metodoDelete(url: string) {
    return this._http.delete(url);
  }
}
