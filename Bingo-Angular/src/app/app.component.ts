import { Component } from '@angular/core';
import { GenerarBalotaService } from './generar-balota.service';
import { GenerarTableroService } from './generar-tablero.service';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [GenerarBalotaService, GenerarTableroService]
})
export class AppComponent {
  title = 'bingoFront';

  constructor(private serviceA: GenerarBalotaService, private serviceB: GenerarTableroService){
      console.log("Se crea componente principal");
  }
  balota: string = "";
  intentos: string = "";
  tablero: any = {"b":["14","15","12"],"i":["30","28","30"],"g":["68","64","64"],"n":["46","49","48"],"o":["76","80","87"]};
  letras = Object.keys(this.tablero);
  numeros = Object.values(this.tablero);
  aciertos: number = 0;
   getBalota():void {
  /**
   * 1. Llamar el servicio
   */
    this.serviceA.getBalota()
    .subscribe((response: any) =>{ 

      this.balota = response.balota;
      this.findNumber(this.balota);
    });
    if (this.aciertos == 15) {
      window.alert("Has Ganado, Felicitaciones!!!");
    }


  }
  getTablero():void {
    this.serviceB.getTablero()
    .subscribe((response: any) =>{ 

      this.tablero = response;
      console.log(this.tablero);
    });

  }
  findNumber(number: string){
    var celda = document.getElementById(number);
    if(celda != null){
      celda.style.backgroundColor = 'yellow'; 
      this.aciertos = this.aciertos + 1;
      console.log(celda)
      console.log(number)
    }

}
}