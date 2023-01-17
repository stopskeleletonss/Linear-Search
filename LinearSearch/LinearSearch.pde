String[] readvalues, splitvalues; //string arrays for reading the values from the text file and for splitting the joined data from the text file
String combinevalues; //string that combines the data from the text file 
int[] numvalues; //int array for switching the data from the text file to numerical
int wantednum; //int variable for the number being searched for in the data from the text file
float currenttime; //float variable for the current time passed in milliseconds since the program began
boolean timerstop; //boolean for whether the timer has stopped or not

void setup() {
  size(200,200);
  valuesetup();
}

void draw() {
  background(0);
  timer();
  linearsearch();
}

void valuesetup() { //function to prepare the values from the text file to be sorted
  readvalues = loadStrings("numbers.txt"); //loads the data from the file into the readvalues array
  combinevalues = join(readvalues, ","); //combines the values held in the readvalues array into one line
  splitvalues = split(combinevalues, ","); //splits the values held in the combinevalues array back into their own separate lines
  numvalues = int(splitvalues); //converts the strings held in the splitvalues array to numerical values
  wantednum = 19; //number being searched for from all values is currently 19, but can be whatever number you change it to
}

void timer() { //function to start a timer at the start of the program, and end when the desired value is found
 fill(255);
 textAlign(CENTER);
 textSize(50);
 text(currenttime/1000, width/2, height/2);
 if (timerstop==false) { //if the timer has not stopped
   currenttime=millis(); //the current time is the total amount of miliseconds since the program was opened
 }
}

void linearsearch() { //function for finding the desired value by going through each section of the array in order until it is found
  for (int index = 0; index < numvalues.length; index++) { //index has an initial value of 0, index must be less than the length of the numvalues array, index = index + 1;
    if (numvalues[index] == wantednum ) { //if the value of the section of the array currently being searched matches the desired value
    timerstop=true; //stop the timer
    println(wantednum +" is in section " +index +" of the array."); //states where the desired value is within the array
    }
  }
}
