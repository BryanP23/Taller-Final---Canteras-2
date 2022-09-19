package com.buda.Bingo.web.controller;

import com.buda.Bingo.model.ColumnasBingo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class GeneratePlay {
    private static String number;
    private static int ronda = 0;

    private static ArrayList<String> usados = new ArrayList<String>();





    public static int getRonda() {
        return ronda;
    }
    public static String getNumber() {
        return number;
    }

    private static ColumnasBingo getRandomColumn() {
        return ColumnasBingo.values()[(int) (Math.random() * ColumnasBingo.values().length)];
    }

    public static String getNumberBalota(){
        while(true){
            String letter = getRandomColumn().toString();
            Random random = new Random();
            int number = 0;
            switch (letter){

                case "B": number = (int) ((random.nextInt(18 - 1) + 1));
                    break;
                case "I": number = (int) ((random.nextInt(37 - 19) + 19));
                    break;
                case "N": number = (int) ((random.nextInt(55 - 38) + 38));
                    break;
                case "G": number = (int) ((random.nextInt(73 - 56) + 56));
                    break;
                case "O": number = (int) ((random.nextInt(90 - 74) + 74));
                    break;
            }
            ronda++;
            String numberSelected = letter + "-" + String.valueOf(number);

            if (usados.contains(numberSelected) == false) {
                usados.add(numberSelected);
                return numberSelected;
            }
            else{continue;}
        }


    }

    public static Boolean existNumber(){
        return false;
    }
}