// Forward and Inverse Kinematics for 3R manipulator
#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

class Forward_kinematics
{
private:
  std::vector<float> theta {0.0,0.0,0.0};
  std::vector<float> d {0.0,0.0,0.0};
  std::vector<float> a {10.0,5.0,5.0};
  std::vector<float> alpha {M_PI/2,0.0,0.0};
  std::vector<std::vector<std::vector<float>>> H{};
  void Validate_theta();


public:
  std::vector<std::vector<float>> multiply(std::vector<std::vector<float>> m1, std::vector<std::vector<float>> m2);
  std::vector<std::vector<float>> DH_function();
};

void Forward_kinematics::Validate_theta()
{
  if (((theta[0]<-M_PI)||(theta[0]>M_PI)) || ((theta[1]<-M_PI/2)||(theta[1]>M_PI/2)) ||
     ((theta[2]<-M_PI)||(theta[2]>M_PI))) throw invalid_argument("Please check your theta values");
}

std::vector<std::vector<float>> Forward_kinematics::multiply(std::vector<std::vector<float>> m1, std::vector<std::vector<float>> m2)
{
  std::vector<std::vector<float> > m3{};
  for(int i=0; i<4;i++){
    std::vector<float> data1;
    for(int j=0;j<4;j++){
      data1.push_back(m1[i][j] * m2[j][i]);
      std::cout<<m1[i][j] * m2[j][i]<<std::endl;
    }
    m3.push_back(data1);
  }
  return m3;
}

std::vector<std::vector<float>> Forward_kinematics::DH_function()
{
  for(int i=0; i<3; ++i)
  {
    std::vector<float> data;
    std::vector<std::vector<float>> data1;

    data.push_back((cos(theta[i]), -sin(theta[i])*cos(alpha[i]), sin(theta[i])*sin(alpha[i]), a[i]*cos(theta[i])));
    data1.push_back(data);
    data.push_back((sin(theta[i]),  cos(theta[i])*cos(alpha[i]),-cos(theta[i])*sin(alpha[i]), a[i]*sin(theta[i])));
    data1.push_back(data);
    data.push_back((0.0,              sin(alpha[i]),               cos(alpha[i]),                d[i]));
    data1.push_back(data);
    data.push_back((0.0,                   0.0,                          0.0,                    1.0));
    data1.push_back(data);
    H.push_back(data1);
  }
  std::vector<std::vector<float>> H0_2;
  std::vector<std::vector<float>> H0_3;
  H0_2 = multiply(H[0], H[1]);
  H0_3 = multiply(H0_2, H[2]);
  return H0_3;
}

int main(){
  Forward_kinematics robot;
  std::vector<std::vector<float>> test;
  test = robot.DH_function();
}