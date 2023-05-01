# Author: Elton Chang
# A program that calculates “coolness” as a function of wind speed and temperature.  


#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MIN_T -99.0
#define MAX_T 50.0
#define MIN_V 0.5
#define MAX_V INFINITY

double calculate_coolness(double T, double V);
void print_table(double (*f)(double, double), double start_T, double end_T, double delta_T, double start_V, double end_V, double delta_V);
void print_usage(char* program_name);
void print_error(char* error_message);

int main(int argc, char* argv[]) {
    if (argc == 1) {
        // No arguments, print table
        print_table(calculate_coolness, -10.0, 40.0, 10.0, 5.0, 15.0, 5.0);
    } else if (argc == 2) {
        // One argument, print table for that temperature
        double T = atof(argv[1]);
        if (T < MIN_T || T > MAX_T) {
            printf("Error: Coolness. Acceptable input values are -99<=T<=50 and 0.5<=V.\n");
            return 1;
        }
        print_table(calculate_coolness, T, T, 1.0, 5.0, 15.0, 5.0);
    } else if (argc == 3) {
        // Two arguments, print single coolness value
        double T = atof(argv[1]);
        double V = atof(argv[2]);
        if (T < MIN_T || T > MAX_T || V < MIN_V || V > MAX_V) {
            printf("Error: Coolness. Acceptable input values are -99<=T<=50 and 0.5<=V.");
            return 1;
        }
        double coolness = calculate_coolness(T, V);
        printf("Temp\tWind\tCoolness\n%.1f\t%.1f\t%.1f\n", T, V, coolness);
    } else {
        // Wrong number of arguments, print usage message
        print_usage(argv[0]);
        return 1;
    }
    return 0;
}

double calculate_coolness(double T, double V) {
    double coolness = 35.74 + 0.6215 * T - 35.75 * pow(V, 0.16) + 0.4275 * T * pow(V, 0.16);
    return coolness;
}

void print_table(double (*f)(double, double), double start_T, double end_T, double delta_T, double start_V, double end_V, double delta_V) {
    printf("Temp\tWind\tCoolness\n");
    for (double T = start_T; T <= end_T; T += delta_T) {
        for (double V = start_V; V <= end_V; V += delta_V) {
            double coolness = f(T, V);
            printf("%.1f\t%.1f\t%.1f\n", T, V, coolness);
        }
        if (T<end_T){
        printf("\n");}
    }
}

void print_usage(char* program_name) {
    printf("Usage: %s [temperature] [wind speed]\n", program_name);
}

void print_error(char* error_message) {
    fprintf(stderr, "%s", error_message);
}

