package com.buda.Bingo.model;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
public class Tablero {
    //ArrayList<String> B = new ArrayList(Arrays.asList(this.GenerateRows()));
    ArrayList<String> B = new ArrayList(List.of(this.GenerateRows(18,1).toArray()));
    ArrayList<String> I = new ArrayList(List.of(this.GenerateRows(37,19).toArray()));
    ArrayList<String> N = new ArrayList(List.of(this.GenerateRows(55,38).toArray()));
    ArrayList<String> G = new ArrayList(List.of(this.GenerateRows(73,56).toArray()));
    ArrayList<String> O = new ArrayList(List.of(this.GenerateRows(90,74).toArray()));

    public ArrayList<String> getB() {
        return B;
    }

    public ArrayList<String> getI() {
        return I;
    }

    public ArrayList<String> getN() {
        return N;
    }

    public ArrayList<String> getG() {
        return G;
    }

    public ArrayList<String> getO() {
        return O;
    }

    static int n;
    public List<String> GenerateRows(int max, int min){
        ArrayList<String> numbers = new ArrayList<String>();
        Random random = new Random();
        while (numbers.size() < 3){
            n =  (random.nextInt(max - min) + min);
            if (numbers.contains(Integer.toString(n))){
                continue;
            }
            numbers.add(Integer.toString(n));
        }
        return numbers;
    }
}
