#include<iostream>
#include<fstream>
#include<conio.h>
#include<stdio.h>
#include<process.h>
#include<string.h>
#include<iomanip>
#include<windows.h>
#include<stdlib.h>
using namespace std;

void write_plot();
void display_allplotsad();
void read_splot(char n[]);
void modify_plot();
void admin_menu();
void hello();
void aexit();

void write_customer();
void display_allplotsct();
void customer_menu();

void welcome();
COORD coord={0,0};
void fordelay(int x);
void cexit();
class Book
{
protected:

    char pno[3];
    char pl[50];
    char psize[10];
    char pf[150];
    float pprice;

public:
    void getpno()
    {

        cout<<"\nEnter the plot no ::";
        cin>>pno;
    }
    void showpno()
    {
        cout<<"\n\nThe plot no is :: "<<pno;

    }


    void getpl()
    {
        cout<<"\n\nEnter the plot location ::";
        cin>>pl;
    }
    void showpl()
    {
        cout<<"\nThe plot Location is :: "<<pl;

    }

    void getpsize()
    {

        cout<<"\n\nEnter the plot size ::";
        cin>>psize;
    }
    void showpsize()
    {
        cout<<"\nThe plot size is :: "<<psize;
    }

    void getpf()
    {

        cout<<"\n\nEnter the plot facilities ::";
        cin>>pf;
    }
    void showpf()
    {
        cout<<"\nThe plot facilities :: "<<pf;
    }

    void getpprice()
    {
        pprice=pprice;
        cout<<"\n\nEnter the plot price ::";
        cin>>pprice;
    }
    void showpprice()
    {
        cout<<"\nThe plot price is ::"<<pprice;

    }

    char* retplot_no()
	{
		return pno;
	}

};

class Admin:public Book
{
public:
    void get_adplot()
    {

                Book::getpno();
                Book::getpl();
                Book::getpsize();
                Book::getpf();
                Book::getpprice();
    }

    void show_adplot()
    {
                Book::showpno();
                Book::showpl();
                Book::showpsize();
                Book::showpf();
                Book::showpprice();
    }
    char* adretplot_no()
    {
        Book::retplot_no();
	}
};

class Customer:public Book
{
protected:
    char cid[10];
    char cname[50];
    char cmobile[10];
    char cadhar[20];
    int  caccno;
    int caccbal;

public:

    void getcid()
    {
        cout<<"\nEnter Your id::";
        cin>>cid;
    }
    void showcid()
    {
        cout<<"\n\nYour id::"<<cid;
    }

    void getcname()
    {
        cout<<"\nEnter Your Name::";
        cin>>cname;
        fflush(stdin);
    }
    void showcname()
    {
        cout<<"\nYour name is::"<<cname;
    }

    void getcmobile()
    {
        cout<<"\nEnter Your Mobile Number::";
        cin>>cmobile;
        fflush(stdin);
    }
    void showcmobile()
    {
        cout<<"\nYour mobile number is::"<<cmobile;
    }

    void getcadhar()
    {
        cout<<"\nEnter Your Aadhar Card number::";
        cin>>cadhar;
        fflush(stdin);
    }
    void showcadhar()
    {
        cout<<"\nYour Aadhar card number is::"<<cadhar;
    }

    void getcaccno()
    {
        cout<<"\nEnter Your account number::";
        cin>>caccno;
        fflush(stdin);
    }
    void showcaccno()
    {
        cout<<"\nYour Account number is::"<<caccno;
    }

    void getcaccbal()
    {
        cout<<"\nEnter Your account balance::";
         cin>>caccbal;
        fflush(stdin);
    }
    void showcaccbal()
    {
        cout<<"\nYour Account balance is::"<<caccbal<<endl<<endl;
    }

    char* retcust_no()
	{
		return cid;
	}

    void show_ctplot()
    {
                Book::showpno();
                Book::showpl();
                Book::showpsize();
                Book::showpf();
                Book::showpprice();
    }

};
fstream fc;
Customer ct;
Admin ad;
fstream fp;
int main()
{

    int chac;
    welcome();
    fordelay(100000000);
    system("color b");
    fordelay(100000000);
    system("color c");
    fordelay(100000000);
    system("color d");
    fordelay(100000000);
    system("color e");
    fordelay(100000000);
    system("color f");
    fordelay(100000000);
    system("cls");
    cout<<"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\t\t\t\tWELCOME\n\n";
     system("color b");
    cout<<"\n1.ADMIN\n2.CUSTOMER";
    cout<<"\n________________________";
    cout<<"\nENTER THE CHOICE ::";
    cin>>chac;
    cout<<"________________________";
    if(chac==1)
    {
        admin_menu();
    }
    else
    {
        system("color c");
        customer_menu();
    }

}
///____________________________________________________________________________________
///      --------------------------ADMIN SECTION-----------------------------
///____________________________________________________________________________________

///Write Plots
void write_plot()
{

    fp.open("plot.txt",ios::out|ios::app);
    ad.get_adplot();
    cout<<"Plots added successfully";
    fp.write((char*)&ad,sizeof(Admin));
    fp.close();
}


///Read All Plots
void display_allplotsad()
{
     	fp.open("plot.txt",ios::in);
     	if(!fp)
     	{
       		cout<<"ERROR!!! FILE COULD NOT BE OPEN ";
       		getch();
       		return;
     	}

        cout<<" _____________\n";
        cout<<"|  Plot List  |\n";
        cout<<"|_____________|\n";
        fp.seekg(0,ios::beg);
            while(1)
            {
                fp.read((char*)&ad,sizeof(Admin));
                if(!fp)
                {
                    break;
                }
                else
                {
                   ad.show_adplot();
                }
            }
        fp.close();
}



///Read Specific Plots
void read_splot(char n[])
{
    cout<<"\n _________________";
	cout<<"\n|  Plots Details  |";
    cout<<"\n|_________________|\n";
	int flag=0;
	fp.open("plot.txt",ios::in);
	while(fp.read((char*)&ad,sizeof(Admin)))
	{
		if((strcmp(ad.retplot_no(),n)==0))
		{
           ad.show_adplot();
            flag=1;
            break;

		}
	}

	fp.close();
	if(flag==0)
    		cout<<"\nPlot does not exist";
}



///Modify Specific Plots
void modify_plot()
{
	char n[3];
	int found=0;
	cout<<"\n_______________________";
	cout<<"\n|  MODIFY Plot RECORD  |";
    cout<<"\n|______________________|\n";
	cout<<"\n\tEnter The Plot Number : ";
	cin>>n;
	fp.open("plot.txt",ios::in|ios::out);
	while(fp.read((char*)&ad,sizeof(Admin)) && found==0)
	{
		if(strcmp(ad.retplot_no(),n)==0)
		{
            ad.show_adplot();

			cout<<"\nEnter The New Details of Plot"<<endl;
            ad.get_adplot();
			int pos=-1*sizeof(ad);
			fp.seekp(pos,ios::cur);
			fp.write((char*)&ad,sizeof(Admin));
			cout<<"\nPlot Updated";
			found=1;
            break;
		}
	}
	fp.close();
	if(found==0)
		cout<<"\nPlot Not Found ";
	getch();
}



///***************************************************************
///               ADMINISTRATOR MENU FUNCTION
///****************************************************************

void admin_menu()
{
     int ch2;
	do
    	{
        cout<<"\n\n\n ______________________";
        cout<<"\n|  ADMINISTRATOR MENU  |";
        cout<<"\n|______________________|";
		cout<<"\n\n1.CREATE PLOT RECORD";
		cout<<"\n2.DISPLAY ALL PLOT RECORD";
		cout<<"\n3.DISPLAY SPECIFIC PLOT RECORD ";
		cout<<"\n4.MODIFY PLOT RECORD";
		cout<<"\n5.Exit\n";
		cout<<"\nENTER THE CHOICE ::";
        cin>>ch2;


	switch(ch2)
	{
    		case 1:
                write_plot();
	    		break;

    		case 2:
    		    cout<<"\n_____________________________\n";
                    display_allplotsad();
                cout<<"\n_____________________________";
                break;

    		case 3:
	       		char num[6];
	       		cout<<"\n\tPlease Enter The Plot Number : ";
	       		cin>>num;
                read_splot(num);
                break;

      		case 4:
                	modify_plot();
                	break;
            case 5:
                    aexit();
                    exit(0);
			break;
      		default:
			cout<<"\nSorry Please try again";

   	}
    }while(1);

}

void aexit()
{
    cout<<"\t\t\t\t ___________________________________________________"<<endl;
    cout<<"\t\t\t\t|***************************************************|"<<endl;
    cout<<"\t\t\t\t|................ALL FOR OUR CUSTOMERS..............|"<<endl;
    cout<<"\t\t\t\t|___________________________________________________|"<<endl;
    cout<<"\t\t\t\t|***************************************************|"<<endl;
}

///________________________________________________________________________________________________________________
///                          -------------------------CUSTOMER SECTION-------------------------
///________________________________________________________________________________________________________________


///write customer
void write_customer()
{

        fc.open("customer.txt",ios::out|ios::app);
                ct.getcid();
                ct.getcname();
                ct.getcmobile();
                ct.getcadhar();
                ct.getcaccno();
                ct.getcaccbal();
                cout<<"\n _________________________________";
                cout<<"\n|  YOUR ENTRY HAS BEEN DONE...!!  |";
                cout<<"\n|_________________________________|";
		fc.write((char*)&ct,sizeof(Customer));
		fc.close();
}

///Display all plots
/*void display_allplotsct()
{
     	fc.open("plot.txt",ios::in);
     	if(!fc)
     	{
       		cout<<"\nERROR!!! FILE COULD NOT BE OPEN ";
       		getch();
       		return;
     	}

	cout<<"\n\n\t\t\tPlot List\n\n";
        fc.seekg(0,ios::beg);
            while(1)
            {
                fc.read((char*)&ct,sizeof(Customer));
                if(!fc)
                {
                    break;
                }
                else
                {
                    ct.show_ctplot();
                }
            }
        fc.close();
}*/
///Display Specific Plot
void display_allplotsct()
{
     	fp.open("plot.txt",ios::in);
     	if(!fp)
     	{
       		cout<<"ERROR!!! FILE COULD NOT BE OPEN ";
       		getch();
       		return;
     	}

        cout<<" _____________\n";
        cout<<"|  Plot List  |\n";
        cout<<"|_____________|\n";
        fp.seekg(0,ios::beg);
            while(1)
            {
                fp.read((char*)&ad,sizeof(Admin));
                if(!fp)
                {
                    break;
                }
                else
                {
                   ad.show_adplot();
                }
            }
        fp.close();
}
///Buy Plot
void buy_custplot()
{
    int flag=0;
    char cpno[3];
    cout<<"Enter Plot Name::";
    cin>>cpno;

        fp.open("plot.txt",ios::in|ios::out|ios::binary|ios::app);
    	fstream fp2,fp1;
    	fp2.open("Temp.txt",ios::out);
    	fp.seekg(0,ios::beg);
    	while(fp.read((char*)&ct,sizeof(Customer)))
	{
		if(strcmpi(ct.retcust_no(),cpno)!=0)
        {
            fp2.write((char*)&ct,sizeof(Customer));
        }
		else
        {
            fp1.write((char*)&ct,sizeof(Customer));
	   		flag=1;
        }
	}
        fp1.close();
        fp2.close();
    	fp.close();
    	remove("plot.txt");
    	rename("Temp.txt","plot.txt");
    	if(flag==1)
        {
            cout<<"\n\n\tPlot Owned";
            cout<<"\nYour balance has been deducted from your account";
     		cout<<"\n\n\tCongratulations.......";

        }

    	else
        {
            cout<<"\n\nPlot Not Found";
        }


}

///Read Specific Customer
void read_scustid(char n[])
{

	int flag=0;
	fp.open("customer.txt",ios::in);
	while(fp.read((char*)&ct,sizeof(Customer)))
	{
		if((strcmp(ct.retcust_no(),n)==0))
		{
            cout<<" \n\n ____________________";
            cout<<"\n|  CUSTOMER DETAILS  |";
            cout<<"\n|____________________|";
            ct.showcid();
            ct.showcname();
            ct.showcmobile();
            ct.showcadhar();
            ct.showcaccno();
            ct.showcaccbal();
            flag=1;
            break;

		}
	}

	fp.close();
	if(flag==0)
    		cout<<"\nCustomer does not exist\n\n";
}

///Customer Menu
void customer_menu()
{
     int chc2,chc3,onct,chc4;

     c_menu:
     c_menu1:
     cout<<"\n\n\t\t\t\t\t\t\tWELCOME\n";
     cout<<"1.NEW CUSTOMER\n";
     cout<<"2.OLD CUSTOMER\n";
     cout<<"3.Exit\n\n";
     cin>>onct;
     if(onct==1)
     {
        do
            {

            cout<<" \n\n _________________";
            cout<<"\n|  CUSTOMER MENU  |";
            cout<<"\n|_________________|\n";
            cout<<"\n1.ADD RECORD";
            cout<<"\n2.GOTO PREVIOUS MENU";
            cout<<"\n3.EXIT\n\n";
            cin>>chc2;

            switch(chc2)
            {
                case 1:
                write_customer();
                cout<<"\nDO YOU WANT TO SEE PLOT DETAILS??(y/n)";
                char cyd;
                cin>>cyd;

                if(cyd=='y'||'Y')
                {
                    display_allplotsct();
                     break;
                }

	    		else
                {
                     break;
                }


                case 2:
                    goto c_menu;
            	case 3:
            	    cexit();
                    exit(0);
                    break;

                default:
                cout<<"\nSorry Please try again";

        }
        }while(1);
    }

    else if(onct==2)
    {
         do
            {
            c_menu3:
            cout<<" \n\n _________________";
            cout<<"\n|  CUSTOMER MENU  |";
            cout<<"\n|_________________|\n";
            cout<<"\nENTER ID FOR VERIFICATION";
            char cust_id[6];
            cout<<"\n\n\tPlease Enter The Customer id :: ";
            cin>>cust_id;
            read_scustid(cust_id);

                if((strcmp(ct.retcust_no(),cust_id)==0))
                {


                    cout<<" \n\n _________________";
                    cout<<"\n|  CUSTOMER MENU  |";
                    cout<<"\n|_________________|\n";
                    cout<<"\n1.DISPLAY ALL PLOTS";
                    cout<<"\n2.Buy Plot";
                    cout<<"\n3.GO TO PREVIOUS MENU";
                    cout<<"\n4.Exit\n\n";
                    cin>>chc3;

                        switch(chc3)
                        {

                            case 1:
                            display_allplotsct();
                            break;

                            case 2:
                            buy_custplot();
                            break;

                            case 3:
                            goto c_menu1;

                            case 4:
                            cexit();
                            exit(0);
                            break;

                            default:
                            cout<<"\nSorry Please try again";

                        }
                }
                else
                {
                     goto c_menu3;
                }

                }while(1);
            }
        else
        {
            cexit();
            exit(0);
        }

    }

void cexit()
{
    cout<<"\t\t\t\t ___________________________________________________"<<endl;
    cout<<"\t\t\t\t|***************************************************|"<<endl;
    cout<<"\t\t\t\t|.......THANK YOU FOR VISITING 'H and M' PLOTS......|"<<endl;
    cout<<"\t\t\t\t|___________________________________________________|"<<endl;
    cout<<"\t\t\t\t|***************************************************|"<<endl;
}


///___________________________________________________________________________________________________________
///                         **********************Graphics**********************
///___________________________________________________________________________________________________________
void gotoxy(int x,int y)
 {
   coord.X=x;
 coord.Y=y;
 SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE),coord);
 }

void welcome()

{
    int i1,j1;
     system("color a");


        for(j1=0;j1<1;j1++)
        {
             for(i1=0;i1<120;i1++)
            {
                gotoxy(i1,j1);printf("*");//top
                fordelay(10000000);
            }
        }
    for(i1=119;i1<120;i1++)
    {
        for(j1=0;j1<30;j1++)
        {
            gotoxy(i1,j1);printf("*");//right
            fordelay(10000000);
        }
    }

    for(i1=0;i1<1;i1++)
    {
        for(j1=0;j1<30;j1++)
        {
            gotoxy(i1,j1);printf("*");//left
            fordelay(10000000);
        }
    }
    for(i1=200;i1<201;i1++)
    {
        for(j1=0;j1<118;j1++)
        {
            gotoxy(i1,j1);printf("*");//bottom
            fordelay(10000000);
        }
    }
    gotoxy(54,3);cout<<"Welcome to H and M";
    gotoxy(54,5);cout<<"   REAL ESTATE";
    gotoxy(7,12);cout<<"H and M' IS INDIA'S FASTEST GROWING PROPERTY WEBSITE THAT HELPS CONNECT BUYERS OF REAL ESTATE ACROSS";
    gotoxy(7,13);cout<<"THE COUNTRY.PLOTS BUYING FOR INDIANS IS BIG FINANCIAL AND EMOTIONAL DECISION AND THEREFORE AT 'H and M'";
    gotoxy(7,14);cout<<"WE PROVIDE YOU WITH THE MOST CONVENIENT PROPERTY SEARCH ENGINE TO FACILITATE IN YOUR DECISION MAKING.";
    gotoxy(7,15);cout<<"WHETHER YOU WISH TO BUY ANYWHERE IN INDIA,OUR SEARCH ENGINE WILL ASSIST YOU BASED ON YOUR PREFERENCES.";
    gotoxy(7,16);cout<<"FURTHER,YOU CAN FILTER THE SEARCH RESULTS AND IDENTIFY NEW EXISTING INDIA PLOTS THAT MEET THE EXPECTATIONS.";
    gotoxy(80,24);cout<<"Made By-";
    gotoxy(80,25);cout<<"Harshit Patel and Mahima Patel";
  }

void fordelay(int x1)
{
int n1,k1;
    for(n1=0;n1<x1;n1++)
    {
        k1=n1;
    }
}
