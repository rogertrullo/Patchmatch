clear all
clc
A=imread('a.png');
B=imread('b.png');
halfwinsize=1;

[offsets,distances]=patchmatch(A,B,halfwinsize);
