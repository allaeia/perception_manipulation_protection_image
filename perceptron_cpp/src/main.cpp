/******************************************************************************
*     Copyright (C) 2014 TANGUY Arnaud arn.tanguy@gmail.com                   *
*                                                                             *
* This program is free software; you can redistribute it and/or modify        *
* it under the terms of the GNU General Public License as published by        *
* the Free Software Foundation; either version 2 of the License, or           *
* (at your option) any later version.                                         *
*                                                                             *
* This program is distributed in the hope that it will be useful,             *
* but WITHOUT ANY WARRANTY; without even the implied warranty of              *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the                *
* GNU General Public License for more details.                                *
*                                                                             *
* You should have received a copy of the GNU General Public License along     *
* with this program; if not, write to the Free Software Foundation, Inc.,     *
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.                 *
 ******************************************************************************/

#include <Eigen/Dense>

#include <functional>
#include <cmath>
#include <ctime>
#include <iostream>


using namespace std;

using Eigen::Matrix;

template<typename T, int Rows, int Cols>
    Matrix<T, Cols, 1>
perceptron(Matrix<T, Rows, Cols> in, Matrix<T, Rows, 1> out, std::function<T(T)> sigma_d, T epsilon, int max_iter)
{
    Matrix<T, Cols, 1> w;
    for (int i = 0; i < Cols; i++ ) {
        w(i, 0) = (double)rand()/RAND_MAX;
    }

    Matrix<T, Cols, 1> delta_w = Matrix<T, Cols, 1>::Zero();
    int iter = 0;
    while (iter < max_iter) {
        delta_w = Matrix<T, Cols, 1>::Zero();
        Matrix<T, Rows, 1> in_w = in * w;
        for (int i = 0; i < Cols; i++ ) {
                auto s = ((out-in_w).transpose()*in.col(i));
                T sigm = sigma_d(in_w(i, 0));
                s *= epsilon * sigm;
                delta_w(i, 0) += s;
        }
        w = w + delta_w;
        ++iter;
    }
    return w;
}

template<typename T, int NbWeights>
Matrix<T, NbWeights, 1>
threshold(Matrix<T, NbWeights, 1> m)
{
    Matrix<T, NbWeights, 1> r;
    for (int i = 0; i < NbWeights; i++ ) {
        r(i, 0) = m(i, 0)>0;
    }
    return r;
}


int main(int argc, char const* argv[])
{
    const int rows = 10;
    const int cols = 8;
    Matrix<double, rows, cols> numbers;
    numbers << 1,1,1,1,1,1,1,-1,
            1,-1,1,1,-1,-1,-1,-1,
            1,1,1,-1,1,1,-1,1,
            1,1,1,1,1,-1,-1,1,
            1,-1,-1,1,-1,-1,1,1,
            1,1,-1,1,1,-1,1,1,
            1,-1,-1,1,1,1,1,1,
            1,1,1,1,-1,-1,-1,1,
            1,1,1,1,1,1,1,1,
            1,1,1,1,-1,-1,1,1;
    Matrix<double, rows, 1> out;
    out << -1, 1, -1, 1, -1, 1, -1, 1, -1, 1;

    cout << "Numbers: " << endl << numbers << endl;
    cout << "Out: " << endl << out << endl << endl;

    auto sigma = [](double x) {
        return 1./(1.+exp(-x));
    };
    auto sigma_d = [&sigma](double x) {
        const double s = sigma(x);
        return s*(1-s);
    };

    const auto w = perceptron<double, rows, cols>(numbers, out, sigma_d, .1618, 100);
    const auto result = numbers * w;
    cout << "weights: " << endl << result <<endl << endl;
    cout << "result: " << endl << threshold<double, rows>(result) <<endl << endl;

    return 0;
}
