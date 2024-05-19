// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ControlStructures {
    //Define custom errors for use within the contract
    error AfterHours(uint256 time);
    error AtLunch();

    //Function to determine the response based on the input number
    function fizzBuzz(uint256 _number) public pure returns (string memory response) {
        //if the Check Number is divisible by both 3 and 5
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz"; // return "FizzBuzz" if both divisible by 3 and 5
        }
        //Check if number is divisible by 3
        else if (_number % 3 == 0) {
            return "Fizz"; //Return "Fizz" if divisible by 3
        }
        //Check if number is divisible by 5
        else if (_number % 5 == 0){
            return "Buzz"; //Return "Buzz" if number is divisible by 5
        }
        //if none of the above conditions are met
        else{ 
            return "Splat"; //Return "GG" i none of the conditions are met
        }
    }

    //Function to determine the response based on the input time
    function doNotDisturb (uint256 _time) public pure returns (string memory response) {
        //Ensure input time is within valid bounds (time is less than 2400
        assert(_time < 2400);

        if (_time > 2200 || _time < 800) {
            revert AfterHours (_time); //revert with custom error if after 10:00PM or before 8:00AM
        }
        else if (_time >= 1200 && _time <= 1299) {
            revert AtLunch (); //revert with Custom error if between 12nn and 1PM
        }
        else if (_time >= 800 && _time <= 1199) {
            return "Morning!"; //Return "Morning!" if its between 8AM and 11:59AM 
        }
        else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!"; //return "Afternoon!" if its between 1PM and 5:59PM
        }
        else if (_time >=1800 && _time <= 2200) {
            return "Evening!"; //Return "Evening!" if its between 6PM and 10PM
        }
    }
}

//Chase&turadinguuu
