/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x36e8438f */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/SHUBHAM JAIN/Documents/proj/proj/a.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1837678034_2592010699(char *, char *, char *, char *);
char *ieee_p_3620187407_sub_436279890_3620187407(char *, char *, char *, char *, int );


static void work_a_2257683136_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(55, ng0);

LAB3:    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2348);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_delta(t1, 8U, 1, 0LL);

LAB2:    t8 = (t0 + 2288);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2257683136_3212880686_p_1(char *t0)
{
    char t1[16];
    char t2[16];
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t3 = (t0 + 684U);
    t4 = *((char **)t3);
    t3 = (t0 + 4000U);
    t5 = ieee_p_2592010699_sub_1837678034_2592010699(IEEE_P_2592010699, t2, t4, t3);
    t6 = ieee_p_3620187407_sub_436279890_3620187407(IEEE_P_3620187407, t1, t5, t2, 1);
    t7 = (t0 + 2384);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t6, 8U);
    xsi_driver_first_trans_fast(t7);

LAB2:    t12 = (t0 + 2296);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2257683136_3212880686_p_2(char *t0)
{
    char t9[16];
    char t10[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t3 = (8 - 8);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)2);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 2420);
    t11 = (t1 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 2304);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t11 = (t0 + 1052U);
    t12 = *((char **)t11);
    t11 = (t0 + 4048U);
    t13 = ieee_p_2592010699_sub_1837678034_2592010699(IEEE_P_2592010699, t10, t12, t11);
    t14 = ieee_p_3620187407_sub_436279890_3620187407(IEEE_P_3620187407, t9, t13, t10, 1);
    t15 = (t0 + 2420);
    t16 = (t15 + 32U);
    t17 = *((char **)t16);
    t18 = (t17 + 40U);
    t19 = *((char **)t18);
    memcpy(t19, t14, 8U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB3;

}


extern void work_a_2257683136_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2257683136_3212880686_p_0,(void *)work_a_2257683136_3212880686_p_1,(void *)work_a_2257683136_3212880686_p_2};
	xsi_register_didat("work_a_2257683136_3212880686", "isim/sadcompleteripplecarypro_isim_beh.exe.sim/work/a_2257683136_3212880686.didat");
	xsi_register_executes(pe);
}
