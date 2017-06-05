#include <Wire.h>
#include <Time.h>
#include <stdlib.h>

enum Choice {
  Empty, X, O};

struct Point {
  int x;
  int y;
};

class Game {
public:
  static const int board_size = 3;
private:
  Choice board[Game::board_size][Game::board_size];    
  int moves;
public:
  Game();
  void make_move(Point p, Choice c);
  Choice board_at(int i, int j);
  int get_moves();
  void update_board();
  bool is_over();
  bool has_won(Choice c);
  void reset();
  void test();
};

class CPU {
  Game& game_;
public:
  CPU(Game& g);
  Point next_move();
};

Game::Game(): 
moves(0){
  for (int i = 0; i < Game::board_size; i++) {
    for (int j = 0; j < Game::board_size; j++) {
      board[i][j] = Empty;
    }
  }
}

void Game::make_move(Point p, Choice c) {
  board[p.x][p.y] = c;
  moves++;
}

int Game::get_moves() {
  return moves;
}

Choice Game::board_at(int i, int j) {
  return board[i][j];
}

void Game::update_board() {
  //todo: update LED lights
}

bool Game::is_over() {
  return has_won(X) || has_won(O) || 
    moves == Game::board_size * Game::board_size;
}

void Game::reset() {
  for (int j = 0; j < Game::board_size; j++) {
    for (int i = 0; i < Game::board_size; i++) {
      board[j][i] = Empty;
    }
  }
  moves = 0;
}

bool Game::has_won(Choice c) {
  bool broken = false;
  for (int i = 0; i < Game::board_size && !broken; i++) {
    if (board[i][i] != c) {
      broken = true;
    }
  }
  if (!broken)
    return true;

  broken = false;
  for (int i = 0; i < Game::board_size && !broken; i++) {
    if (board[Game::board_size - i - 1][i] != c) {
      broken = true;
    }
  }
  if (!broken)
    return true;

  broken = false;
  for (int i = 0; i < Game::board_size && !broken; i++) {
    if (board[i][Game::board_size - i - 1] != c) {
      broken = true;
    }
  }
  if (!broken)
    return true;
  for (int j = 0; j < Game::board_size; j++) {
    broken = false;
    for (int i = 0; i < Game::board_size && !broken; i++) {
      if (board[j][i] != c) {
        broken = true;
      }
    }
    if (!broken)
      return true;
  }
  for (int j = 0; j < Game::board_size; j++) {
    broken = false;
    for (int i = 0; i < Game::board_size && !broken; i++) {
      if (board[i][j] != c) {
        broken = true;
      }
    }
    if (!broken)
      return true;
  }
  return false;
}

CPU::CPU(Game &g):
game_(g) {
}
Point CPU::next_move(){
  Point p;
  do {
    p.x = random() % Game::board_size;
    p.y = random() % Game::board_size;
  } 
  while (!game_.is_over() && game_.board_at(p.x, p.y) != Empty);
  return p;
}


Game game;
CPU cpu(game);

int const ledR0 = 8;
int const ledG0 = 6;

int const ledR1 = 2;
int const ledG1 = 5;

int const ledR2 = 3;
int const ledG2 = 4;

int const ledR3 = 12;
int const ledG3 = 13;

int const ledR4 = 10;
int const ledG4 = 11;

int const ledR5 = 7;
int const ledG5 = 9;

int const ledR6 = 1;
int const ledG6 = 0;

int const ledR7 = 16; 
int const ledG7 = 17; 

int const ledR8 = 14; 
int const ledG8 = 15; 



//rest of leds

void Game::test() {
  for (int i = 0; i < Game::board_size; i++) {
    for (int j = 0; j < Game::board_size; j++) {
     
      if (i==j)
        board[i][j] = X;
       
        
    }
  }
}

void setup()
{

 
  
  Wire.begin(5);
  Wire.onReceive(receiveEvent);
 // Serial.begin(9600);
  game.test();

  pinMode(ledR0,OUTPUT);
  pinMode(ledG0,OUTPUT);
  pinMode(ledR1,OUTPUT);
  pinMode(ledG1,OUTPUT);
  pinMode(ledR2,OUTPUT);
  pinMode(ledG2,OUTPUT);
  pinMode(ledR3,OUTPUT);
  pinMode(ledG3,OUTPUT);
  pinMode(ledR4,OUTPUT);
  pinMode(ledG4,OUTPUT);
  pinMode(ledR5,OUTPUT);
  pinMode(ledG5,OUTPUT);
  pinMode(ledR6,OUTPUT);
  pinMode(ledG6,OUTPUT);
  pinMode(ledR7,OUTPUT);
  pinMode(ledG7,OUTPUT);
  pinMode(ledR8,OUTPUT);
  pinMode(ledG8,OUTPUT);

  digitalWrite(1,LOW);
    digitalWrite(0,LOW);


}

void turnOn(int led) {
  digitalWrite(led, HIGH);
  delay(5);
  digitalWrite(led, LOW);
}

int updateLights() {
  Choice c;
  if ((c = game.board_at(0,0)) !=Empty) {
    if (c == X) 
      turnOn(ledR0);
    else 
      turnOn(ledG0);
  }

  if ((c = game.board_at(0,1)) !=Empty) {
    if (c == X) 
      turnOn(ledR1);
    else 
      turnOn(ledG1);
  }



  if ((c = game.board_at(0,2)) !=Empty) {
    if (c == X) 
      turnOn(ledR2);
    else 
      turnOn(ledG2);
  }     


  if ((c = game.board_at(1,0)) !=Empty) {
    if (c == X) 
      turnOn(ledR3);
    else 
      turnOn(ledG3);
  } 



  if ((c = game.board_at(1,1)) !=Empty) {
    if (c == X) 
      turnOn(ledR4);
    else 
      turnOn(ledG4);
  }

  if ((c = game.board_at(1,2)) !=Empty) {
    if (c == X) 
      turnOn(ledR5);
    else 
      turnOn(ledG5);
  }


  if ((c = game.board_at(2,0)) !=Empty) {
    if (c == X) 
      turnOn(ledR6);
    else 
      turnOn(ledG6);
  }


  if ((c = game.board_at(2,1)) !=Empty) {
    if (c == X) 
      turnOn(ledR7);
    else 
      turnOn(ledG7);
  }


  if ((c = game.board_at(2,2)) !=Empty) {
    if (c == X) 
      turnOn(ledR8);
    else 
      turnOn(ledG8);
  }
  return 0;
}
void loop()
{
  updateLights();

}

void receiveEvent(int howMany){

  if(Wire.available()){

    int btn_num = Wire.read();
    Point p;
    if (btn_num == 0) {
      p.x = 0;
      p.y = 0;
    } else if (btn_num == 1) {
      p.x = 0;
      p.y = 1;
    }else if (btn_num == 2) {
      p.x = 0;
      p.y = 2;
    }else if (btn_num == 3) {
      p.x = 1;
      p.y = 0;
    }else if (btn_num == 4) {
      p.x = 1;
      p.y = 1;
    }else if (btn_num == 5) {
      p.x = 1;
      p.y = 2;
    }else if (btn_num == 6) {
      p.x = 2;
      p.y = 0;
    }else if (btn_num == 7) {
      p.x = 2;
      p.y = 1;
    }else if (btn_num == 8) {
      p.x = 2;
      p.y = 2;
    }
    if (game.board_at(p.x, p.y) == Empty) {
      game.make_move(p, X);
      game.make_move(cpu.next_move(), O);
    }
    Serial.print(btn_num); 

  }

}






