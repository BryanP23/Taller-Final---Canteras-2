import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class GenerarBalotaService {

  constructor(
    private http: HttpClient
  ) { 
    console.log('Llamar servicio');
  }

    getBalota(): any {
      return this.http.get('http://localhost:8080/bingo/api/jugar');
    }
}
