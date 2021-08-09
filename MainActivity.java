package com.example.rockpaperscissors;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Random;

public class MainActivity extends AppCompatActivity {


    Button b_rock, b_scissors, b_paper, b_multi;
    TextView tv_score;
    ImageView iv_ComputerChoice, iv_HumamChoice;
    int HumanScore, ComputerScore = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().getDecorView().setBackgroundColor(Color.rgb(255,127,80));
        setContentView(R.layout.activity_main);


        b_paper = (Button) findViewById(R.id.b_paper);
        b_scissors = (Button) findViewById(R.id.b_scissors);
        b_rock = (Button) findViewById(R.id.b_rock);
        b_multi = (Button) findViewById(R.id.b_multi);


        iv_ComputerChoice = (ImageView) findViewById(R.id.iv_ComputerChoice);
        iv_HumamChoice = (ImageView) findViewById(R.id.iv_HumanChoice);

        tv_score = (TextView) findViewById(R.id.tv_score);


        b_multi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {



                Intent intent = new Intent(MainActivity.this, MultiplayerActivity.class);
                startActivity(intent);

            }

        });

        b_paper.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_HumamChoice.setImageResource(R.drawable.paper);
                String message = play_turn("paper");
                //Toast.makeText(MainActivity.this, message, Toast.LENGTH_SHORT).show();
                tv_score.setText("Your Score: " + Integer.toString(HumanScore) + " · Cumputer: " + Integer.toString(ComputerScore));
            }
        });

        b_rock.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_HumamChoice.setImageResource((R.drawable.rock));
                String message = play_turn("rock");
                //Toast.makeText(MainActivity.this, message, Toast.LENGTH_SHORT).show();
                tv_score.setText("Your Score: " + Integer.toString(HumanScore) + " · Cumputer " + Integer.toString(ComputerScore));
            }
        });


        b_scissors.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_HumamChoice.setImageResource(R.drawable.scissors);
                String message = play_turn("scissors");
                //Toast.makeText(MainActivity.this, message, Toast.LENGTH_SHORT).show();
                tv_score.setText("Your Score: " + Integer.toString(HumanScore) + " · Cumputer " + Integer.toString(ComputerScore));



            }

        });
    }

    public String play_turn(String player_choice) {

        String computer_choice = "";
        Random r = new Random();

        //
        int computer_choice_number = r.nextInt(3) + 1;

        if (computer_choice_number == 1) {
            computer_choice = "rock";
        } else if (computer_choice_number == 2) {
            computer_choice = "scissors";
        } else if (computer_choice_number == 3) {
            computer_choice = "paper";
        }

        //set the computer image based on his choice

        if (computer_choice == "rock") {
            iv_ComputerChoice.setImageResource(R.drawable.rock);
        } else if (computer_choice == "scissors") {
            iv_ComputerChoice.setImageResource(R.drawable.scissors);
        } else if (computer_choice == "paper") {
            iv_ComputerChoice.setImageResource(R.drawable.paper);
        }

        //computer vs human how wins
        if (computer_choice == player_choice) {
            getWindow().getDecorView().setBackgroundColor(Color.GRAY);
            return "Draw";
        } else if (player_choice == "rock" && computer_choice == "scissors") {
            HumanScore++;
            getWindow().getDecorView().setBackgroundColor(Color.GREEN);
            return "You Win";
        } else if (player_choice == "rock" && computer_choice == "paper") {
            ComputerScore++;
            getWindow().getDecorView().setBackgroundColor(Color.RED);
            return "You Lose";
        } else if (player_choice == "paper" && computer_choice == "scissors") {
            ComputerScore++;
            getWindow().getDecorView().setBackgroundColor(Color.RED);
            return "You Lose";
        } else if (player_choice == "paper" && computer_choice == "rock") {
            HumanScore++;
            getWindow().getDecorView().setBackgroundColor(Color.GREEN);
            return "You Win";
        } else if (player_choice == "scissors" && computer_choice == "rock") {
            ComputerScore++;
            getWindow().getDecorView().setBackgroundColor(Color.RED);
            return "You Lose";
        } else if (player_choice == "scissors" && computer_choice == "paper") {
            HumanScore++;
            getWindow().getDecorView().setBackgroundColor(Color.GREEN);
            return "You Win";
        } else return "Not Sure";
    }
}
