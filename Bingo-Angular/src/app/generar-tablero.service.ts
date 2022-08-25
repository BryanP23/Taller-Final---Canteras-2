import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class GenerarTableroService {

  constructor(
    private http: HttpClient
  ) { 
    console.log('Llamando el servicio del tablero');
  }

    getTablero(): any {
      return this.http.get('http://localhost:8080/bingo/api/tablero');
    }
}