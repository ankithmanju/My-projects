#include "opencv2/opencv.hpp"
#include "opencv2/videoio/videoio.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <vector>
#include <iostream>
#include <windows.h>
#include <stdio.h>
#include<time.h>
#include <stdlib.h> 
#include<string>
#include <fstream>



using namespace std;

using namespace cv;




// data logger to log the data and store the images along with unix time stamp.
//int timer(int frame_rate)
//{
	
	//SYSTEMTIME tms;
	//GetSystemTime(&tms);
	//long long msec=(long long) tms.wMilliseconds;
	//acc_msec=acc_msec+msec;
	
//}
int flag=0;

double frame_rate_check(float recording_speed) // checks whether we need integral frame rate or not
{
	double check;
	if(recording_speed<1)
	{
		//check= second_count(recording_speed); // 1 says second count needs to checked 
			if(recording_speed==0.5)
		{
			check=2; //every 2 seconds one frame stored
		}
		else if(int(recording_speed*10)==2)
		{
			check=5; //every 5 seconds one frame stored

		}
		flag=1;	//double temp[]={check,1};
		return check;
	}
	else if(recording_speed>=1)
	{
		//check = miliseconds_ticks(recording_speed); // 2 says miliseconds count to be checked
		
		 if(recording_speed==1)
			 {
				  check=((1000/recording_speed)-30);
			 }
			 else if(recording_speed==5)
			 {
				  check=((1000)-200);
			 }
			 else if(recording_speed==10)
			 {
				  check=((1000)-420);
			 }
			 else 
			 {
				  check=((1000/recording_speed));
			 }
			 
		    flag=2;
			return check;
	}
	
}



int main(int, char**)
{
    long int i=0;
    VideoCapture cap(0);
	//char str[100];
	//ifstream test;
	//test.open("test.txt", std::ifstream::in);
	 //test.getline(str, 100, '#');

    //test.getline(str, 100, '#');
	
       //cout << str << endl;
	
	 //test.close();

	fstream dataFile("Default.txt", ios::in);
	string input[10];
	

   
	int j=0;
	while (dataFile.good())
	{
	getline(dataFile, input[j]);
	j++;
	}
	
	dataFile.close();
	
	// set camera properties
	cap.set(CAP_PROP_FRAME_WIDTH,stod(input[0]));
    cap.set(CAP_PROP_FRAME_HEIGHT,stod(input[1]));
	//cap.set(CAP_PROP_FPS, stod(input[5]));
	float frame_rate=stod(input[5]);// due to fractional frame rates present
	
	cout<<"Recording Images from Video Frames :)"<<endl;
	long long temp_msec=0;
	long long acc_msec=0;
	float check;
	check=frame_rate_check(frame_rate);
	time_t stored_second = time(NULL);
	long long test_condition;
	for(;;)// open the default camera
	{	
			if(!cap.isOpened())// check if we succeeded
			{
				return -1;
				break;
			}
		 //timer(frame_rate);
		
		 
		 //acc_msec=msec;
		 if(flag==1)
		{
			time_t t = time(NULL);
			acc_msec=t;
			 test_condition=stored_second+check;


		}
		else
		{
			SYSTEMTIME tms;
			GetSystemTime(&tms);
			acc_msec=tms.wMilliseconds;
			 test_condition=check;
		}
		

		 if(acc_msec>=test_condition)
   {
	   stored_second=acc_msec;
		//temp_msec=msec;
		//if(temp_msec==9)
		//{
			//t/emp_msec=0;
		//}
		//cout<<temp_msec<<endl;
		Mat edges;
		cap.read(edges);// reads in the data of the current frame and stores the frame in variable edges.
		i++;		
		time_t t = time(NULL);
		SYSTEMTIME tms;
		GetSystemTime(&tms);
		//cout<<t<<endl;
		
		//printf("The system time is: %02d:%02d:%02d.%03d\n", 
		//tms.wYear,tms.wMonth,tms.wDayOfWeek,tms.wDay,tms.wHour, tms.wMinute, tms.wSecond, tms.wMilliseconds);
	
	
		long long msec=(long long) tms.wMilliseconds;
		long long wYear=(long long) tms.wYear;
		long long wMonth=(long long) tms.wMonth;
		long long wDayOfWeek=(long long) tms.wDayOfWeek;
		long long wDay=(long long) tms.wDay;
		long long wHour=(long long) tms.wHour;
		
		//cout<<input[3]+"/"+to_string(wYear)+"-"+to_string(wMonth)+"-"+to_string(wDayOfWeek)+"-"+to_string(t)+"."+to_string(msec)+".jpg"<<endl;
		string imagename =input[3]+"/"+to_string(wYear)+"-"+to_string(wMonth)+"-"+to_string(wDayOfWeek)+"-"+to_string(t)+"."+to_string(msec)+".jpg";// neededto insert formula for timestamp to unix timestamp conversion
		//string imagename="D:/mypic/ "+to_string(wYear)+"-"+to_string(wMonth)+"-"+to_string(wDayOfWeek)+to_string(t)+"."+to_string(msec)+".jpg";
		vector<int> compression_params;
		compression_params.push_back(IMWRITE_JPEG_QUALITY);
		compression_params.push_back(stoi(input[2]));//input[2] or the thord line of text file gives the compression parameter of th jpeg
		imwrite(imagename , edges,compression_params);
		//}
		//system("pause");
			if(input[4]=="1")
		{
			 imshow("frame", edges);     
                 
		}
   }
	
	
	if(waitKey(30) == 27) //wait for 'esc' key press for 30 ms. If 'esc' key is pressed, break loop
       {
                cout << "esc key is pressed by user" << endl; 
                break; 
       }
	
    }
	return 0;
}
	 



	
		
	 



	