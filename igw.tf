# Internet Gateway
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.project}-igw"
  }

  depends_on = [aws_vpc.vpc]
}
