package com.example.rockpaperscissors;


import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;



public class MultiplayerActivity extends AppCompatActivity {


    Button b_rock, b_scissors, b_paper, b_rock1, b_scissors1, b_paper1;
    TextView tv_score_multi,tv_winner1,tv_winner2;
    ImageView iv_player2, iv_player1;
    int player1Score,counter, player2Score = 0;

    String player1_choice;
    String player2_choice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_multiplayer);

        getWindow().getDecorView().setBackgroundColor(Color.YELLOW);

        b_paper = (Button) findViewById(R.id.b_paper);
        b_scissors = (Button) findViewById(R.id.b_scissors);
        b_rock = (Button) findViewById(R.id.b_rock);

        b_paper1 = (Button) findViewById(R.id.b_paper1);
        b_scissors1 = (Button) findViewById(R.id.b_scissors1);
        b_rock1 = (Button) findViewById(R.id.b_rock1);

        iv_player2 = (ImageView) findViewById(R.id.iv_player2);
        iv_player1 = (ImageView) findViewById(R.id.iv_player1);

        tv_score_multi = (TextView) findViewById(R.id.tv_score_multi);

        tv_winner1=(TextView)findViewById(R.id.tv_winner1);
        tv_winner2=(TextView)findViewById(R.id.tv_winner2);

        if (counter<2 ){

        b_paper1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_player1.setImageResource(R.drawable.paper);
                player1_choice = "paper";

                String message = winner(player1_choice,player2_choice);
                counter++;
                // Toast.makeText(MultiplayerActivity.this, message, Toast.LENGTH_SHORT).show();
                //tv_score.setText("Player 1 Score: " + Integer.toString(player1Score) + " · Player 2: " + Integer.toString(player2Score));
            }
        });

        b_rock1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_player1.setImageResource((R.drawable.rock));
                player1_choice = "rock";
                String message = winner(player1_choice,player2_choice);
                counter++;
                //Toast.makeText(MultiplayerActivity.this, message, Toast.LENGTH_SHORT).show();
                //tv_score.setText("Player 1 Score: " + Integer.toString(player1Score) + " · Player 2 " + Integer.toString(player2Score));
            }
        });


        b_scissors1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_player1.setImageResource(R.drawable.scissors);
                player1_choice = "scissors";
                String message = winner(player1_choice,player2_choice);
                counter++;
                //Toast.makeText(MultiplayerActivity.this, message, Toast.LENGTH_SHORT).show();
                //tv_score.setText("Player 1 Score: " + Integer.toString(player1Score) + " · Player 2 " + Integer.toString(player2Score));


            }
        });

        b_paper.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_player2.setImageResource(R.drawable.paper);
                player2_choice = "paper";
                String message = winner(player1_choice,player2_choice);
                counter++;
                //String message = play_turn2("paper");
                //Toast.makeText(MultiplayerActivity.this, message, Toast.LENGTH_SHORT).show();
                //tv_score.setText("Your Score: " + Integer.toString(HumanScore) + " · Player 2: " + Integer.toString(ComputerScore));
            }
        });

        b_rock.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_player2.setImageResource((R.drawable.rock));
                player2_choice = "rock";
                String message = winner(player1_choice,player2_choice);
                counter++;
                //String message = play_turn2("rock");
                //Toast.makeText(MultiplayerActivity.this, message, Toast.LENGTH_SHORT).show();
                //tv_score.setText("Your Score: " + Integer.toString(HumanScore) + " · Player 2 " + Integer.toString(ComputerScore));
            }
        });


        b_scissors.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iv_player2.setImageResource(R.drawable.scissors);
                player2_choice = "scissors";
                String message = winner(player1_choice,player2_choice);
                counter++;
                //String message = play_turn2("scissors");
                //Toast.makeText(MultiplayerActivity.this, message, Toast.LENGTH_SHORT).show();
                //tv_score.setText("Your Score: " + Integer.toString(HumanScore) + " · Cumputer " + Integer.toString(ComputerScore));
            }
        });

            String message = winner(player1_choice,player2_choice);
           // Toast.makeText(MultiplayerActivity.this, message, Toast.LENGTH_SHORT).show();
            //Toast.makeText(MultiplayerActivity.this, player1_choice, Toast.LENGTH_SHORT).show();


        }
        if (counter>1){

            counter=0;
            player1_choice=null;
            player2_choice=null;
            tv_winner1.setText("FIGHT");
            tv_winner2.setText("FIGHT");
        }

    }









    public String winner(String player1_choice,String player2_choice) {


        if (player2_choice == null && player1_choice == null) {
            tv_winner1.setText("FIGHT");
            tv_winner2.setText("FIGHT");

            return "Draw";
        }
        else if (player1_choice == "rock" && player2_choice == "scissors") {
            tv_winner1.setText("Draw");
            tv_winner2.setText("Draw");
            return "Draw";
        }
        else if (player1_choice == "rock" && player2_choice == "scissors") {
            player1Score++;
            tv_winner1.setText("Winner");
            tv_winner2.setText("Loser");
            tv_score_multi.setText("Score:Player 1:  "+Integer.toString(player1Score)+" · Player 2: "+Integer.toString(player2Score));
            return "You Win";
        } else if (player1_choice == "rock" && player2_choice == "paper") {
            player2Score++;
            tv_winner1.setText("Loser");
            tv_winner2.setText("Winner");
            tv_score_multi.setText("Score:Player 1:  "+Integer.toString(player1Score)+" · Player 2: "+Integer.toString(player2Score));
            return "You Lose";
        } else if (player1_choice == "paper" && player2_choice == "scissors") {
            player2Score++;
            tv_winner1.setText("Loser");
            tv_winner2.setText("Winner");
            tv_score_multi.setText("Score:Player 1:  "+Integer.toString(player1Score)+" · Player 2: "+Integer.toString(player2Score));
            return "You Lose";
        } else if (player1_choice == "paper" && player2_choice == "rock") {
            player1Score++;
            tv_winner1.setText("Winner");
            tv_winner2.setText("Loser");
            tv_score_multi.setText("Score:Player 1:  "+Integer.toString(player1Score)+" · Player 2: "+Integer.toString(player2Score));
            return "You Win";
        } else if (player1_choice == "scissors" && player2_choice == "rock") {
            player2Score++;
            tv_winner1.setText("Loser");
            tv_winner2.setText("Winner");
            tv_score_multi.setText("Score:Player 1:  "+Integer.toString(player1Score)+" · Player 2: "+Integer.toString(player2Score));
            return "You Lose";
        } else if (player1_choice == "scissors" && player2_choice == "paper") {
            player1Score++;
            tv_winner1.setText("Winner");
            tv_winner2.setText("Loser");
            tv_score_multi.setText("Score:Player 1:  "+Integer.toString(player1Score)+" · Player 2: "+Integer.toString(player2Score));
            return "You Win";
        } else return "Not Sure";

    }

}
