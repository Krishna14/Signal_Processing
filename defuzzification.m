function [ crisp ] = defuzzification( data, rules )

  crisp = rules( data );