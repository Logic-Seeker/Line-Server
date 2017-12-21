#!/bin/bash -e


# reset database
bundle exec rake db:reset


# rake preprocess_file:save_file_lines[/Users/shobhabshrestha/Desktop/Document/firstDocument.txt]

filename="$1"
rake preprocess_file:save_file_lines[$filename]

rails s