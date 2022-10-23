import 'package:pingpong/main.dart';

enum Direction {
  up,
  down,
  left,
  right,
}

class BallState {
  double ballX;
  double ballY;
  Direction vDirection;
  Direction hDirection;

  BallState({
    this.ballX = 0,
    this.ballY = 0,
    this.vDirection = Direction.down,
    this.hDirection = Direction.right,
  });

  void update() {
    ballX = _getNewBallX();
    ballY = _getNewBallY();
    hDirection = _getNewHDirection();
    vDirection = _getNewVDirection();
  }

  bool checkCollision(double upRocketX, double downRocketX) {
    if (ballY <= minY) {
      return ballX < (upRocketX - rocketLength) ||
          ballX > (upRocketX + rocketLength);
    }

    if (ballY >= maxY) {
      return ballX < (downRocketX - rocketLength) ||
          ballX > (downRocketX + rocketLength);
    }

    return false;
  }

  void reset() {
    ballX = 0;
    ballY = 0;
    vDirection = Direction.down;
    hDirection = Direction.right;
  }

  double _getNewBallY() {
    if (vDirection == Direction.down) {
      return ballY + ballStep;
    }
    return ballY - ballStep;
  }

  double _getNewBallX() {
    if (hDirection == Direction.right) {
      return ballX + ballStep;
    }
    return ballX - ballStep;
  }

  Direction _getNewVDirection() {
    if (ballY <= minY) {
      return Direction.down;
    } else if (ballY >= maxY) {
      return Direction.up;
    } else {
      return vDirection;
    }
  }

  Direction _getNewHDirection() {
    if (ballX <= -1) {
      return Direction.right;
    } else if (ballX >= 1) {
      return Direction.left;
    } else {
      return hDirection;
    }
  }
}
