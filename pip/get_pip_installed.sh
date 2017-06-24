#!/bin/bash

rm pip2.txt pip3.txt; pip2 freeze --local > pip2.txt; pip3 freeze --local > pip3.txt
