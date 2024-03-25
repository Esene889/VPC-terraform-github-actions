#ALB

resource "aws_lb" "alb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [vr.sg_id]
  subnets            = var.subnets

  enable_deletion_protection = true


}

#Listener

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


#Target Group

resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id


}

#Target Group attachment

resource "aws_lb_target_group_attachment" "tg_att" {
  target_group_arn = aws_lb_target_group.tg.arn
  count            = length(var.instances)
  target_id        = var.instances[count.index]
  port             = 80
}
