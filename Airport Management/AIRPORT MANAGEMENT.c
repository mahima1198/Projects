#include<stdio.h>
#include<conio.h>
FILE *f1,*f2,*f3,*fp1w,*fp2w,*fp3w,*fp1r,*fp2r,*fp3r,*f4,*f5,*f6,*fp4w,*fp5w,*fp6w,*fp4r,*fp5r,*fp6r;;

void passenger1()
{
    int age[10],n1,i;
    char name[10][20],gen[10][20];
    char ch;
    printf("\n\t How many tickets do you want to book ? : \t");
    scanf("%d",&n1);
    for(i=0; i<n1; i++)
    {
        printf("\n\n\t Enter Passenger Details : \t");
        printf("\n\t\tName : ");
        fflush(stdin);
        gets(name[i]);
        printf("\n\t\tAge : ");
        scanf("%d",&age[i]);
        getchar();
        printf("\n\t\tGender :");
        fflush(stdin);
        scanf("%s",gen[i]);
    }
        fp1w=fopen("passatm.txt","w+");

        for(i=0; i<n1; i++)
        {
            fflush(stdin);
            fprintf(fp1w,"\n\n\t\t%s : %s\n\t\t%s : %d\n\t\t%s : %s\n","Name",name[i],"Age",age[i],"Gender",gen[i]);
        }
        fclose(fp1w);

}

void passenger2()
{
    int age[10],n2,i;
    char name[10][20],gen[10][20];
    char ch;
    printf("\n\t How many tickets do you want to book ? : \t");
    scanf("%d",&n2);
    for(i=0; i<n2; i++)
    {
        printf("\n\n\t Enter Passenger Details : \t");
        printf("\n\t\tName : ");
        fflush(stdin);
        gets(name[i]);
        printf("\n\t\tAge : ");
        scanf("%d",&age[i]);
        getchar();
        printf("\n\t\tGender :");
        fflush(stdin);
        scanf("%s",gen[i]);
    }
        fp2w=fopen("passatu.txt","w+");

        for(i=0; i<n2; i++)
        {
            fflush(stdin);
            fprintf(fp2w,"\n\n\t\t%s : %s\n\t\t%s : %d\n\t\t%s : %s\n","Name",name[i],"Age",age[i],"Gender",gen[i]);
        }
        fclose(fp2w);

}

void passenger3()
{
    int age[10],n3,i;
    char name[10][20],gen[10][20];
    char ch;
    printf("\n\t How many tickets do you want to book ? : \t");
    scanf("%d",&n3);
    for(i=0; i<n3; i++)
    {
        printf("\n\n\t Enter Passenger Details : ");
        printf("\n\t\tName : ");
        fflush(stdin);
        gets(name[i]);
        printf("\n\t\tAge : ");
        scanf("%d",&age[i]);
        getchar();
        printf("\n\t\tGender :");
        fflush(stdin);
        scanf("%s",gen[i]);
    }
        fp3w=fopen("passatj.txt","w+");

        for(i=0; i<n3; i++)
        {
            fflush(stdin);
            fprintf(fp3w,"\n\n\t\t%s : %s\n\t\t%s : %d\n\t\t%s : %s\n","Name",name[i],"Age",age[i],"Gender",gen[i]);
        }

            fclose(fp3w);
}

void Add_Flight_details()
{
    int aa;
    char d1[20],d2[20],d3[20],ar1[20],ar2[20],ar3[20];
    char fn1[20],fn2[20],fn3[20],st1[20],st2[20],st3[20];
    float pr1,pr2,pr3;
    admin:
    printf(" \n\n\t Enter your choice :\n\n\t\t\t1. Ahmadabad(AMD) to Mumbai(BOM) \n\t\t\t2. Ahmadabad(AMD) to  Udaipur (UDR)\n\t\t\t3. Ahmadabad(AMD) to Jaipur(JAI) \n\t\t\t4. Exit  \t");
    scanf("%d",&aa);
    switch(aa)
    {
        case 1:
                printf("\n   Enter flight name:");
               fflush(stdin);
                scanf("%s",fn1);
                printf("\n  Enter timings Departure and Arrival :");
                fflush(stdin);
                scanf("%s",d1);
                fflush(stdin);
                scanf("%s",ar1);
                printf("\n  Enter ticket Price : ");
                scanf("%f",&pr1);
                printf("\n  Enter Status :");
                fflush(stdin);
                printf("\n");
                scanf("%s",st1);
                f1=fopen("atm.txt","a+");

                fflush(stdin);
                fprintf(f1,"\n\n %s  \t%s\t\t%s\t%f   \t%s",fn1,d1,ar1,pr1,st1);
                fclose(f1);


                goto admin;
                break;
        case 2:
                printf("\n   Enter flight name:");
               fflush(stdin);
                scanf("%s",fn2);
                printf("\n  Enter timings Departure and Arrival :");
               fflush(stdin);
                scanf("%s",d2);
                fflush(stdin);
                scanf("%s",ar2);
                printf("\n  Enter ticket Price : ");
                scanf("%f",&pr2);
                printf("\n  Enter Status :");
                fflush(stdin);
                printf("\n");
                scanf("%s",st2);

                f2=fopen("atu.txt","a+");

                fflush(stdin);
               fprintf(f2,"\n\n %s  \t%s\t\t%s\t%f   \t%s",fn2,d2,ar2,pr2,st2);
                fclose(f2);
                goto admin;
                break;

        case 3:

                printf("\n   Enter flight name:");
               fflush(stdin);
                scanf("%s",fn3);
                printf("\n  Enter timings Departure and Arrival :");
                fflush(stdin);
                scanf("%s",d3);
                fflush(stdin);
                scanf("%s",ar3);
                printf("\n  Enter ticket Price : ");
                scanf("%f",&pr3);
                printf("\n  Enter Status :");
                fflush(stdin);
                  printf("\n");
                scanf("%s",st3);
                f3=fopen("atj.txt","a+");

                fflush(stdin);
                fprintf(f3,"\n\n %s  \t%s\t\t%s\t%f   \t%s",fn3,d3,ar3,pr3,st3);
                fclose(f3);
                goto admin;
                break;

        case 4:
            {
                break;
            }
        default:
            {
                 printf("\n\t\t Please Enter write choice : \t");
                goto admin;
            }
    }
}
void passenger_Details()
{
    int x;
    char ch;
    aa:
        printf("\n\n\tChoose :");
    printf("\n\n\t\t\t1. Ahmadabad to Mumbai \n\t\t\t2. Ahmadabad to Udaipur \n\t\t\t3. Ahmadabad to Jaipur \n\t\t\t4. Exit.  \t");
    scanf("%d",&x);
  switch(x)
  {
  case 1:
    fp1r=fopen("passatm.txt","r");
        {
            ch=getc(fp1r);
            while(ch!=EOF)
                {
                    printf("%c",ch);
                    ch=getc(fp1r);
                }
        }
                fclose(fp2r);
                goto aa;
                break;
  case 2:
    fp2r=fopen("passatu.txt","r");
        {
            ch=getc(fp2r);
            while(ch!=EOF)
                {
                    printf("%c",ch);
                    ch=getc(fp2r);
                }
        }
                fclose(fp2r);
                goto aa;
                break;
  case 3:
    fp3r=fopen("passatj.txt","r");
        {
            ch=getc(fp3r);
            while(ch!=EOF)
                {
                    printf("%c",ch);
                    ch=getc(fp3r);
                }
        }
                fclose(fp3r);
                goto aa;
                break;
    case 4:
        {
            break;
        }
    default:
        {
             printf("\n\t\t Please Enter right choice : \t");
            goto aa;
        }
  }
}


void admin()
{

    int pass,user;
    aa:
        printf(" \t\t\t--------------------------------");
    printf(" \n\n\t\t\t    UserName : ");
    fflush(stdin);
    scanf("%d",&user);
    printf(" \t\t\t--------------------------------");
    if(user==98)
    {
        bb:
    printf(" \n\n\t\t\t    Password : ");
    scanf("%d",&pass);
    printf(" \t\t\t--------------------------------");
        if(pass==57)
        {

    int i;
    a:
    printf("\n\n\tWhat do u want to do ? \n\t\t1.ADD Flight Details \n\t\t2.Show Details of Passenger \n\t\t3.Exit \t\t");
    scanf("%d",&i);
    switch(i)
    {
    case 1:
        Add_Flight_details();
           goto a;
          break;
    case 2:
        passenger_Details();
           goto a;
          break;
    case 3:
        break;
           goto a;
    default:
         printf("\n\t\t Please Enter write choice : \n\t\t");
        goto a;
            }
        }


    else
    {
    printf("\n\n\t\t Please Rewrite your Password \n");
    goto bb;
    }
}
    else
    {
        printf("\n\n\t\t Please Rewrite your UserName \n");
        goto aa;
    }
}
void atm()
{
    char c,ch;
        f1=fopen("atm.txt","r");// Ahmadabad(AMD) to Mumbai(BOM)
        fseek(f1,0,SEEK_SET);

         while((ch=getc(f1))!=EOF)
            printf("%c",ch);

            printf("\n\n\t Do  you want book ticket?? y-YES  ,  n-NO. \t");
            fflush(stdin);
              printf("\n");
            scanf("%c",&c);
            if(c=='Y' ||c=='y')
            {
                passenger1();
            }
}

void atu()
{
    char d,ch;
    f2=fopen("atu.txt","r");// Ahmadabad(AMD) to Mumbai(BOM)
    fseek(f2,0,SEEK_SET);
    while((ch=getc(f2))!=EOF)
            printf("%c",ch);
            printf("\n\n\t Do  you want book ticket?? y-YES  ,  n-NO.  \t");
            fflush(stdin);
              printf("\n");
            scanf("%c",&d);
            if(d=='Y' ||d=='y')
            {
                passenger2();
            }
}

void atj()
{
    char e,ch;
    f3=fopen("atj.txt","r");// Ahmadabad(AMD) to Mumbai(BOM)
    fseek(f3,0,SEEK_SET);
    while((ch=getc(f3))!=EOF)
            printf("%c",ch);

            printf("\n\n\t Do  you want book ticket?? y-YES  ,  n-NO.   \t");
            fflush(stdin);
              printf("\n");
            scanf("%c",&e);
            if(e=='Y' || e=='y')
            {
                passenger3();
            }
}
    void Inquiry()
    {
        int a;
        again:
        printf(" \n\n\tWhere do you want to go ?  :\n\n\t\t\t1. Ahmadabad(AMD) to Mumbai(BOM) \n\t\t\t2. Ahmadabad(AMD) to  Udaipur (UDR)\n\t\t\t3. Ahmadabad(AMD) to Jaipur(JAI)\n\t\t\t4. Exit.    \t");
        scanf("%d",&a);
        printf("\n");
        switch(a)
        {
        case 1:
            atm();// Ahmadabad(AMD) to  mumbai (BOM)
            goto again;
            break;
        case 2:
            atu();// Ahmadabad(AMD) to  Udaipur (UDR)
            goto again;
             break;
        case 3:
            atj();//Ahmadabad(AMD) to Jaipur(JAI)
            goto again;
             break;
        case 4:
            break;
        default:
             printf("\n\t\t Please Enter write choice : \t");
            goto again;
        }
}
void domestic()
{
        int b,c;
        menu:
        printf("\n\n\t Enter your choice : \n\t\t1. ADMIN \n\t\t2. INQUIRY \n\t\t3. Exit  \t");
        scanf("%d",&b);
         printf("\n");
        switch(b)
        {
        case 1:
            admin();
            goto menu;
            break;
        case 2:
            Inquiry
            ();
            goto menu;
            break;
        case 3:
            break;
        default:
             printf("\n\t\t Please Enter write choice : \t");
            goto menu;
        }
}


void passenger4()
{
    int age[10],n4,i;
    char name[10][20],gen[10][20];
    char ch;
    printf("\n\t How many tickets do you want to book ? : \t");
    scanf("%d",&n4);
    for(i=0; i<n4; i++)
    {
        printf("\n\n\t Enter Passenger Details : ");
        printf("\n\t\tName : ");
        fflush(stdin);
        gets(name[i]);
        printf("\n\t\tAge : ");
        scanf("%d",&age[i]);
        getchar();
        printf("\n\t\tGender :");
        fflush(stdin);
        scanf("%s",gen[i]);
    }
        fp4w=fopen("passitd.txt","w+");

        for(i=0; i<n4; i++)
        {
            fflush(stdin);
            fprintf(fp4w,"\n\n\t\t%s : %s\n\t\t%s : %d\n\t\t%s : %s\n","Name",name[i],"Age",age[i],"Gender",gen[i]);
        }
        fclose(fp4w);

}

void passenger5()
{
    int age[10],n5,i;
    char name[10][20],gen[10][20];
    char ch;
    printf("\n\t How many tickets do you want to book ? : \t");
    scanf("%d",&n5);
    for(i=0; i<n5; i++)
    {
        printf("\n\n\t Enter Passenger Details : ");
        printf("\n\t\tName : ");
        fflush(stdin);
        gets(name[i]);
        printf("\n\t\tAge : ");
        scanf("%d",&age[i]);
        getchar();
        printf("\n\t\tGender :");
        fflush(stdin);
        scanf("%s",gen[i]);
    }
        fp5w=fopen("passith.txt","w+");

        for(i=0; i<n5; i++)
        {
            fflush(stdin);
            fprintf(fp5w,"\n\n\t\t%s : %s\n\t\t%s : %d\n\t\t%s : %s\n","Name",name[i],"Age",age[i],"Gender",gen[i]);
        }
        fclose(fp5w);

}

void passenger6()
{
    int age[10],n6,i;
    char name[10][20],gen[10][20];
    char ch;
    printf("\n\t How many tickets do you want to book ? : \t");
    scanf("%d",&n6);
    for(i=0; i<n6; i++)
    {
        printf("\n\n\t Enter Passenger Details : ");
        printf("\n\t\tName : ");
        fflush(stdin);
        gets(name[i]);
        printf("\n\t\tAge : ");
        scanf("%d",&age[i]);
        getchar();
        printf("\n\t\tGender :");
        fflush(stdin);
        scanf("%s",gen[i]);
    }
        fp6w=fopen("passitu.txt","w+");

        for(i=0; i<n6; i++)
        {
            fflush(stdin);
            fprintf(fp6w,"\n\n\t\t%s : %s\n\t\t%s : %d\n\t\t%s : %s\n","Name",name[i],"Age",age[i],"Gender",gen[i]);
        }

            fclose(fp6w);
}

void Add_Flight_detail()
{
    int aa1;
    char d4[20],d5[20],d6[20],ar4[20],ar5[20],ar6[20];
    char fn4[20],fn5[20],fn6[20],st4[20],st5[20],st6[20];
    float pr4,pr5,pr6;
    admin1:
    printf(" \n\n\t Enter your choice :\n\n\t\t\t1. INDAI(IND) to DUBAI(DUB) \n\t\t\t2. INDIA(IND) to  HONGKONG (HK)\n\t\t\t3. INDIA(IND) to UNITED STATES OF AMERICA(USA) \n\t\t\t4. Exit \t");
    scanf("%d",&aa1);
    switch(aa1)
    {
        case 1:
                printf("\n   Enter flight name:");
               fflush(stdin);
                scanf("%s",fn4);
                printf("\n  Enter timings Departure and Arrival :  ");
                fflush(stdin);
                scanf("%s",d4);
                fflush(stdin);
                scanf("%s",ar4);
                printf("\n  Enter ticket Price : ");
                scanf("%f",&pr4);
                printf("\n  Enter Status :");
                fflush(stdin);
                printf("\n");
                scanf("%s",st4);
                f4=fopen("itd.txt","a+");

                fflush(stdin);
                fprintf(f4,"\n\n %s\t%s\t\t%s\t%f   \t%s",fn4,d4,ar4,pr4,st4);
                fclose(f4);


                goto admin1;
                break;
        case 2:
                printf("\n   Enter flight name:");
               fflush(stdin);
                scanf("%s",fn5);
                printf("\n  Enter timings Departure and Arrival :  ");
                fflush(stdin);
                scanf("%s",d5);
                fflush(stdin);
                scanf("%s",ar5);
                printf("\n  Enter ticket Price : ");
                scanf("%f",&pr5);
                printf("\n  Enter Status :");
                fflush(stdin);
                printf("\n");
                scanf("%s",st5);
                f5=fopen("ith.txt","a+");

                fflush(stdin);
               fprintf(f5,"\n\n %s\t%s\t\t%s\t%f   \t%s",fn5,d5,ar5,pr5,st5);
                fclose(f5);
                goto admin1;
                break;

        case 3:

                printf("\n   Enter flight name:");
               fflush(stdin);
                scanf("%s",fn6);
                printf("\n  Enter timings Departure and Arrival :  ");
                fflush(stdin);
                scanf("%s",d6);
                fflush(stdin);
                scanf("%s",ar6);
                printf("\n  Enter ticket Price : ");
                scanf("%f",&pr6);
                printf("\n  Enter Status :");
                fflush(stdin);
                  printf("\n");
                scanf("%s",st6);
                f6=fopen("itu.txt","a+");

                fflush(stdin);
                fprintf(f6,"\n\n %s\t%s\t\t%s\t%f   \t%s",fn6,d6,ar6,pr6,st6);
                fclose(f6);
                goto admin1;
                break;

        case 4:
            {
                break;
            }
        default:
            {
                 printf("\n\t\t Please Enter write choice : \t");
                goto admin1;
            }
    }
}
void passenger_Detail()
{
    int x1;
    char ch;
    aa1:

        printf("\n\n\tChoose : \t");
    printf("\n\n\t\t\t1. INDIA  to DUBAI \n\t\t\t2. INDIA to HONGKONG \n\t\t\t3. INDIA to USA \n\t\t\t4. Exit. \t");
    scanf("%d",&x1);
  switch(x1)
  {
  case 1:
    fp4r=fopen("passitd.txt","r");
        {
            ch=getc(fp4r);
            while(ch!=EOF)
                {
                    printf("%c",ch);
                    ch=getc(fp4r);
                }
        }
                fclose(fp4r);
                goto aa1;
                break;
  case 2:
    fp5r=fopen("passith.txt","r");
        {
            ch=getc(fp5r);
            while(ch!=EOF)
                {
                    printf("%c",ch);
                    ch=getc(fp5r);
                }
        }
                fclose(fp5r);
                goto aa1;
                break;
  case 3:
    fp6r=fopen("passitu.txt","r");
        {
            ch=getc(fp6r);
            while(ch!=EOF)
                {
                    printf("%c",ch);
                    ch=getc(fp6r);
                }
        }
                fclose(fp6r);
                goto aa1;
                break;
    case 4:
        {
            break;
        }
    default:
        {
             printf("\n\t\t Please Enter write choice : \t");
            goto aa1;
        }
  }
}


void admin1()
{

    int pass,user;
    aa:
        printf(" \t\t\t--------------------------------");
    printf(" \n\n\t\t\t    UserName : ");

    fflush(stdin);
    scanf("%d",&user);
     printf(" \t\t\t--------------------------------");
    if(user==98)
    {
        bb:
    printf(" \n\n\t\t\t    Password : ");
    scanf("%d",&pass);
    printf(" \t\t\t--------------------------------");
        if(pass==57)
        {

    int i1;
    a1:
    printf("\n\n\tWhat do u want to do ? \n\t\t1.ADD Flight Details \n\t\t2.Show Details of Passenger \n\t\t3.Exit  \t");
    scanf("%d",&i1);
    switch(i1)
    {
    case 1:
        Add_Flight_detail();
           goto a1;
          break;
    case 2:
        passenger_Detail();
           goto a1;
          break;
    case 3:
        break;
           goto a1;
    default:
        printf("\n\t\t Please Enter write choice : \n");
        goto a1;
    }
}
 else
    {
    printf("\n\n\t\t Please Rewrite your Password \n");
    goto bb;
    }
    }
    else
    {
        printf("\n\n\t\t Please Rewrite your UserName \n");
        goto aa;
    }
}

void itd()
{
    char c,ch;
        f4=fopen("itd.txt","r");// INDIA (IND) to DUBAI(DUB)
        fseek(f4,0,SEEK_SET);

         while((ch=getc(f4))!=EOF)
            printf("%c",ch);

            printf("\n\n\t Do  you want book ticket?? y-YES  ,  n-NO.\n\t");
            fflush(stdin);
              printf("\n");
            scanf("%c",&c);
            if(c=='Y' ||c=='y')
            {
                passenger4();
            }
}

void ith()
{
    char d,ch;
    f5=fopen("ith.txt","r");// INDIA (IND) to HONGKONG(HK)
    fseek(f5,0,SEEK_SET);
    while((ch=getc(f5))!=EOF)
            printf("%c",ch);
            printf("\n\n\t Do you want book ticket?? y-YES  ,  n-NO.\n\t");
            fflush(stdin);
              printf("\n");
            scanf("%c",&d);
            if(d=='Y' ||d=='y')
            {
                passenger5();
            }
}

void itu()
{
    char e,ch;
    f6=fopen("itu.txt","r");// INDIA (IND) to UNITED STATES OF AMERICA(USA)
    fseek(f6,0,SEEK_SET);
    while((ch=getc(f6))!=EOF)
            printf("%c",ch);

            printf("\n\n\t Do you want book ticket?? y-YES  ,  n-NO. \n\t");
            fflush(stdin);
              printf("\n");
            scanf("%c",&e);
            if(e=='Y' || e=='y')
            {
                passenger6();
            }
}
    void Inquiry_inter()
    {
        int a1;
        again1:
        printf(" \n\n\t\tWhere do you want to go ?  :\n\n\t\t\t1. INDIA  to DUBAI \n\t\t\t2. INDIA to HONGKONG \n\t\t\t3. INDIA to USA \n\t\t\t 4. Exit.\t\t");
        scanf("%d",&a1);
        printf("\n");
        switch(a1)
        {
        case 1:
            itd();// INDIA(IND) TO DUBAI(DUB)
            goto again1;
            break;
        case 2:
            ith();// INDIA(IND) TO HONGKONG(HK)
            goto again1;
             break;
        case 3:
            itu();// INDIA(IND) TO UNITED STATES OF AMERICA(USA)
            goto again1;
             break;
        case 4:
            break;
        default:
             printf("\n\t\t Please Enter write choice : \t");
            goto again1;
        }
}


void international()
{
    int m,c;
        menu:
        printf("\n\n\t Enter your choice : \n\t\t1. ADMIN \n\t\t2. INQUIRY \n\t\t3. Exit  \t");
        scanf("%d",&m);
         printf("\n");
        switch(m)
        {
        case 1:
            admin1();
            goto menu;
            break;
        case 2:
            Inquiry_inter();
            goto menu;
            break;
        case 3:
            break;
        default:
             printf("\n\t\t Please Enter write choice : \t");
            goto menu;
        }
}

int main()
{
    int a;

   printf("\n\t                              *                                   ");
   printf("\n\t                             * *                               ");
   printf("\n\t                            *   *                               ");
   printf("\n\t                           *     *                                ");
   printf("\n\t               * * * * * * * * * * * * * * * * *                 ");
   printf("\n\t                *        *         *          *                ");
   printf("\n\t                 *      *           *        *                 ");
   printf("\n\t                  *    *    AIRPORT  *      *                  ");
   printf("\n\t                   *  *               *    *                    ");
   printf("\n\t                    **                 *  *                    ");
   printf("\n\t                    **                  **                     ");
   printf("\n\t                   *  *    MANAGEMENT   **                    ");
   printf("\n\t                  *    *               *  *                   ");
   printf("\n\t                 *      *             *    *                     ");
   printf("\n\t                *        *           *      *                   ");
   printf("\n\t               *          *         *        *                  ");
   printf("\n\t              *            *       *          *                 ");
   printf("\n\t             * * * * * * * *** * ** * * * * * **                   ");
   printf("\n\t                             *   *                               ");
   printf("\n\t                               *                                 ");
   printf(" \n\t\n\n\n       ");
   printf("\n                                                              ");

   printf("\n                 |                                              |   ");
   printf("\n                 |   -- By  !!!!!!!!!!!!!!!!!!!!!!!!!!!!        |   ");
   printf("\n                 |          !! !!!!!!!!!!!!!!!!!!!!!! !!        | ");
   printf("\n                 |          !! !!                  !! !!        |       ");
   printf("\n                 |          !! !!   TITHI PATEL    !! !!        |    ");
   printf("\n                 |          !! !!   MAHIMA PATEL   !! !!        |         ");
   printf("\n                 |          !! !!                  !! !!        |      ");
   printf("\n                 |          !! !!!!!!!!!!!!!!!!!!!!!! !!        |    ");
   printf("\n                 |          !!!!!!!!!!!!!!!!!!!!!!!!!!!!        |    ");

   printf("\n\n                                                              ");


    again:
    printf(" \n\n\n\t* Enter your choice : \n\n\t 1.Domestic Flight\n\t 2.International Flight\n\t 3.Exit\n\t");
    scanf("%d",&a);
     printf("\n");

    switch(a)
    {
    case 1:
        domestic();
        goto again;
        break;
    case 2:
        international();
        goto again;
        break;
    case 3:
        printf(" \n\n\n\t\t ********* Thank You So Much For Visit ********\n\n\t\t\t\tFrom :  Tithi Patel \n\t\t\t\t\tMahima patel  \n\n\n\n\n");
        break;
    default:
         printf("\n\t\t Please Enter write choice : \t");
        goto again;
    }
}
