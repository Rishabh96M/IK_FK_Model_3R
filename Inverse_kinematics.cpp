// Forward and Inverse Kinematics for 3R manipulator

#include <iostream>
#include <cmath>
#include <fstream>
#include <sstream>
#include <vector>

using namespace std;

class Robot{
  private:
    std::vector<float> theta {0.0,0.0,0.0};
    std::vector<float> d {0.0,0.0,0.0};
    std::vector<float> a {10.0,5.0,5.0};
    std::vector<float> alpha {M_PI/2,0.0,0.0};
    std::vector<std::vector<std::vector<float>>> H{};
    void Validate_theta();


  public:
    std::vector<std::vector<float>> multiply(std::vector<std::vector<float>> m1, std::vector<std::vector<float>> m2);
    std::vector<std::vector<float>> ForwardKinematics_DH_function();
    vector<double> InverseKinematics_Angles(double x, double y, double z);
};

void Robot::Validate_theta()
{
  if (((theta[0]<-M_PI)||(theta[0]>M_PI)) || ((theta[1]<-M_PI/2)||(theta[1]>M_PI/2)) ||
     ((theta[2]<-M_PI)||(theta[2]>M_PI))) throw invalid_argument("Please check your theta values");
}

std::vector<std::vector<float>> Robot::multiply(std::vector<std::vector<float>> m1, std::vector<std::vector<float>> m2){
  std::vector<std::vector<float> > m3{};
  for(int i=0; i<4;i++){
    std::vector<float> data;
    
    for(int j=0;j<4;j++){
      int sum = 0;
      for(int k=0;k<4;k++) sum+=(m1[i][k] * m2[k][j]);
      data.push_back(sum);
    }
    m3.push_back(data);
  }
  return m3;
}

std::vector<std::vector<float>> Robot::ForwardKinematics_DH_function()
{
  for(int i=0; i<3; ++i){
    std::vector<std::vector<float>> data;
    data.push_back({cos(theta[i]), -sin(theta[i])*cos(alpha[i]), sin(theta[i])*sin(alpha[i]), a[i]*cos(theta[i])});
    data.push_back({sin(theta[i]),  cos(theta[i])*cos(alpha[i]),-cos(theta[i])*sin(alpha[i]), a[i]*sin(theta[i])});
    data.push_back({0.0,              sin(alpha[i]),               cos(alpha[i]),                d[i]});
    data.push_back({0.0,                   0.0,                          0.0,                    1.0});

    H.push_back(data);
  }
  std::vector<std::vector<float>> H0_2;
  std::vector<std::vector<float>> H0_3;
  H0_2 = multiply(H[0], H[1]);
  H0_3 = multiply(H0_2, H[2]);
  cout<<"H0_3 size"<< H0_3.size()<<endl;
  
  return H0_3;
}

vector<double> Robot::InverseKinematics_Angles(double x, double y, double z)
{
  std::vector<double> angles;
  double phi_1 = acos((pow(a[2],2) - pow(a[1],2) - (pow(x-10,2)+pow(y,2)+pow(z,2)))/(-2*a[1]*sqrt(pow(x-10,2)+pow(y,2)+pow(z,2))));
  double phi_2 = atan2(z,(pow(x-10,2)+pow(y,2)));
  double phi_3 = acos((-pow(a[2],2) - pow(a[1],2) + (pow(x-10,2)+pow(y,2)+pow(z,2)))/(-2*a[1]*a[2]));
  cout<<"phi3:::"<<phi_3<<std::endl;;
  double theta1 = atan2(y,x);
  double theta2 = phi_2 - phi_1;
  double theta3 = M_PI-phi_3;
  angles = {theta1, theta2, theta3};
  return angles;
}

int main(){
  Robot robot;
  std::vector<std::vector<float>> test;
  double v[9][10];
  int i = 0, k = 0;
  std::ifstream in("input.in");
  std::string line;
  std::vector<double> ik_return;

  test = robot.ForwardKinematics_DH_function();
  while (std::getline(in, line))
  {
      float value;
      int k = 0;
      std::stringstream ss(line);

      while (ss >> value)
      {
        v[i][k] = value;
        ++k;
      }

      ik_return = robot.InverseKinematics_Angles(v[i][0],v[i][1],v[i][2]);  
      ++i;
  }
}
