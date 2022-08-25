package com.buda.Bingo.web.controller;

import com.buda.Bingo.model.ColumnasBingo;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.Map;

@RestController
@RequestMapping("/jugar")
public class BalotaController {

    @CrossOrigin(origins = "http://localhost:4200/")
    @GetMapping("")
    public ResponseEntity<Object> generateBalota(){
        String number = GeneratePlay.getNumberBalota();

        return ResponseEntity.status(HttpStatus.ACCEPTED).body(Map.of(
                "balota", number,
                "ronda", GeneratePlay.getRonda()
                ));
    }
}
